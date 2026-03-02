import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: ProfileCard(
          name: "John Doe",
          image: "https://picsum.photos/200",
          bio: "Flutter Developer | UI Designer",
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String image;
  final String bio;

  ProfileCard({
    required this.name,
    required this.image,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              bio,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}