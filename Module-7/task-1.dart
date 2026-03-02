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
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = "Rajkot";
  String temperature = "";
  String description = "";

  Future<void> getWeather() async {
    final apiKey = "YOUR_API_KEY";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    setState(() {
      temperature = data["main"]["temp"].toString();
      description = data["weather"][0]["description"];
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(city, style: TextStyle(fontSize: 24)),
            Text("$temperature °C", style: TextStyle(fontSize: 40)),
            Text(description),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getWeather,
              child: Text("Refresh"),
            )
          ],
        ),
      ),
    );
  }
}