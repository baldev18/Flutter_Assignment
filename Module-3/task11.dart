import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Counter')),
        body: Center(
          child: Text(
            '$count',
            style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
