import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Task31()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 8)
                ],
              ),
              child: Text("This is a card"),
            ),
            Positioned(
              bottom: -20,
              right: -20,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}