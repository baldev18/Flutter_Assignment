import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<String> images = [
    'https://picsum.photos/400?random=1',
    'https://picsum.photos/400?random=2',
    'https://picsum.photos/400?random=3'
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      currentPage = (currentPage + 1) % images.length;
      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Image Carousel')),
        body: PageView.builder(
          controller: controller,
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
