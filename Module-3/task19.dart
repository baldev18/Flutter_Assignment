import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> allItems = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Grapes',
    'Pineapple'
  ];

  List<String> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = allItems;
  }

  void search(String value) {
    setState(() {
      filtered = allItems
          .where((item) =>
          item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Search')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: search,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filtered[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
