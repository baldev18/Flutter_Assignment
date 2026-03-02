import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 22))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 22))),
    Center(child: Text('Settings Screen', style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Navigation Drawer')),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Menu', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}
