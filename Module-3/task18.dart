import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String category = 'General';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Feedback Form')),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Comments'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: category,
                isExpanded: true,
                items: ['General', 'Bug', 'Suggestion']
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
