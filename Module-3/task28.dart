import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Shoes',
      'price': '\$50',
      'image': 'https://picsum.photos/200?1'
    },
    {
      'name': 'Watch',
      'price': '\$80',
      'image': 'https://picsum.photos/200?2'
    },
    {
      'name': 'Bag',
      'price': '\$40',
      'image': 'https://picsum.photos/200?3'
    },
    {
      'name': 'Cap',
      'price': '\$20',
      'image': 'https://picsum.photos/200?4'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: EdgeInsets.all(10),
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        products[index]['image']!,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(products[index]['name']!),
                      Text(products[index]['price']!),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
