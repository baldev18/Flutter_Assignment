import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("notesBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final box = Hive.box("notesBox");
  TextEditingController controller = TextEditingController();

  void addNote() {
    if (controller.text.isNotEmpty) {
      box.add(controller.text);
      controller.clear();
    }
  }

  void deleteNote(int index) {
    box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter note",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: addNote,
              child: Text("Save Note"),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return Center(child: Text("No Notes Yet"));
                  }

                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final note = box.getAt(index) ?? "";

                      return Card(
                        child: ListTile(
                          title: Text(note),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteNote(index),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}