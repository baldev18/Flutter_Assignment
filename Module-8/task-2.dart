import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("todoBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoScreen());
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var box = Hive.box("todoBox");
  TextEditingController controller = TextEditingController();

  void addTask() {
    box.add(controller.text);
    controller.clear();
    setState(() {});
  }

  void deleteTask(int index) {
    box.deleteAt(index);
    setState(() {});
  }

  void updateTask(int index) {
    box.putAt(index, controller.text);
    controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      body: Column(
        children: [
          TextField(controller: controller),
          Row(
            children: [
              ElevatedButton(onPressed: addTask, child: Text("Add")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(box.getAt(index)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => updateTask(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}