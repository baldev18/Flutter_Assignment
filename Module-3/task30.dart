import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Task30()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height: 200, color: Colors.blue),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 60,
              backgroundImage:
                  NetworkImage("https://picsum.photos/200"),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("John Doe",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Flutter Developer",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}