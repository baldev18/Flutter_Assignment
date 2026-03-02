import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cartCount = 0;

  final List<String> items = [
    'Shoes',
    'Shirt',
    'Watch',
    'Bag',
    'Cap'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cart ($cartCount)'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    cartCount++;
                  });
                },
                child: Text('Add to Cart'),
              ),
            );
          },
        ),
      ),
    );
  }
}
