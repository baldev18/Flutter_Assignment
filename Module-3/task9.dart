import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String display = '';

  void addValue(String value) {
    setState(() {
      display += value;
    });
  }

  void calculate() {
    try {
      final result = double.parse(display);
      setState(() {
        display = result.toString();
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                display,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  '7','8','9','/',
                  '4','5','6','*',
                  '1','2','3','-',
                  '0','.','=','+'
                ].map((e) {
                  return ElevatedButton(
                    onPressed: () {
                      if (e == '=') {
                        calculate();
                      } else {
                        addValue(e);
                      }
                    },
                    child: Text(e),
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
