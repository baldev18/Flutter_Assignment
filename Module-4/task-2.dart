import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerHome(),
    );
  }
}

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer Home")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text("Menu"))),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DrawerHome()));
              },
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text("Home Screen")),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile Screen")),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings Screen")),
    );
  }
}