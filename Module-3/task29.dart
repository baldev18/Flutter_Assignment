import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Task29()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://picsum.photos/300",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.black.withOpacity(0.5),
            ),
            Text(
              "Overlay Text",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}