import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  final List<String> images = [
    'https://picsum.photos/300?random=1',
    'https://picsum.photos/300?random=2'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Change Image')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              images[index],
              height: 250,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  index = index == 0 ? 1 : 0;
                });
              },
              child: Text('Change Image'),
            )
          ],
        ),
      ),
    );
  }
}
