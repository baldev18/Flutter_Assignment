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
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List articles = [];

  Future<void> getNews() async {
    final apiKey = "YOUR_API_KEY";
    final url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    setState(() {
      articles = data["articles"];
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App")),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(articles[index]["title"] ?? ""),
            subtitle: Text(articles[index]["source"]["name"] ?? ""),
          );
        },
      ),
    );
  }
}