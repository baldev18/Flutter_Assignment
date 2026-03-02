import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> items = List.generate(20, (index) => index);
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels ==
          controller.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  void loadMore() {
    setState(() {
      int currentLength = items.length;
      items.addAll(
          List.generate(20, (index) => currentLength + index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Infinite List')),
        body: ListView.builder(
          controller: controller,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item ${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
