import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> images = List.generate(
    12,
        (index) => 'https://picsum.photos/200?random=$index',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Grid'),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
