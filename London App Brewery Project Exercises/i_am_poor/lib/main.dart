import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[800],
        appBar: AppBar(
          title: const Text('I am Poor :('),
          backgroundColor: Colors.teal[900],
        ),
        body: const Center(
          child: Image(
              image: AssetImage('images/img_1.png')),
        ),
      )
    );
  }


}
