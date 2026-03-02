import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive Row'),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 150,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 150,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 150,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

