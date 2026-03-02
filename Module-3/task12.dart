import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Toggle Switch')),
        body: Container(
          color: isOn ? Colors.blue : Colors.white,
          child: Center(
            child: Switch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
