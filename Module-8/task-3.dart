import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("notesBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NotesScreen());
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  var box = Hive.box("notesBox");
  TextEditingController controller = TextEditingController();

  void addNote() {
    box.add(controller.text);
    controller.clear();
    setState(() {});
  }

  void deleteNote(int index) {
    box.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes App")),
      body: Column(
          children: [
          TextField(controller: controller),
      ElevatedButton(onPressed: addNote, child: Text("Save Note")),
      Expanded(
        child: ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(box.getAt(index)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteNote(index),
              ),
            );
          },
        ),
      ),
    ),
    ),
    );
  }
}