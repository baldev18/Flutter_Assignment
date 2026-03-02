import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController controller = TextEditingController();

  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add({'title': controller.text, 'done': false});
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Task Manager')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter task',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: addTask,
                    child: Text('Add'),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: tasks.map((task) {
                  return CheckboxListTile(
                    title: Text(task['title']),
                    value: task['done'],
                    onChanged: (value) {
                      setState(() {
                        task['done'] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
