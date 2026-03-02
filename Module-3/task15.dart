import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BoxFit fit = BoxFit.cover;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Asset Image')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image.jpg',
              height: 250,
              width: double.infinity,
              fit: fit,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fit = fit == BoxFit.cover
                      ? BoxFit.contain
                      : fit == BoxFit.contain
                      ? BoxFit.fill
                      : BoxFit.cover;
                });
              },
              child: Text('Change BoxFit'),
            )
          ],
        ),
      ),
    );
  }
}
