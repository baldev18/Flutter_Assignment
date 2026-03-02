import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rating Widget")),
      body: Center(child: RatingWidget()),
    );
  }
}

class RatingWidget extends StatefulWidget {
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
          },
          icon: Icon(
            Icons.star,
            color: index < rating ? Colors.orange : Colors.grey,
            size: 35,
          ),
        );
      }),
    );
  }
}