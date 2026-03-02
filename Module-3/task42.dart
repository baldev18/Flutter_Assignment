import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Progress Bar")),
      body: Center(
        child: ProgressBar(percentage: 70),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double percentage;

  ProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            width: 300 * (percentage / 100),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Center(
            child: Text("${percentage.toInt()}%"),
          )
        ],
      ),
    );
  }
}