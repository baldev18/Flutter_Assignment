import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> names = [
    'Amit',
    'Rahul',
    'Priya',
    'Sneha',
    'Vikas',
    'Riya',
    'Karan',
    'Neha'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Name List'),
        ),
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(names[index]),
              onTap: () {
                print('Name tapped');
              },
            );
          },
        ),
      ),
    );
  }
}
