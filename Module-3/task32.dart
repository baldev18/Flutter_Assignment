import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Task32()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                "Button",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Positioned(
              top: -20,
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.star, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}