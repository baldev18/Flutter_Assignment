import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieScreen(),
    );
  }
}

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  TextEditingController controller = TextEditingController();
  List movies = [];

  Future<void> searchMovie(String name) async {
    final apiKey = "YOUR_API_KEY";
    final url =
        "https://www.omdbapi.com/?s=$name&apikey=$apiKey";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    setState(() {
      movies = data["Search"] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Search")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Search Movie",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchMovie(controller.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(movies[index]["Title"] ?? ""),
                  subtitle: Text(movies[index]["Year"] ?? ""),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}