// ignore_for_file: prefer_const_constructors

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
        backgroundColor: Colors.teal[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'images/icon.png'
                )
              ),
              Text("Ariba Anjum",
                style: TextStyle(
                  fontFamily: 'Italianno',
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("FLUTTER DEVELOPER",
                style: TextStyle(
                    fontFamily: 'Sora',
                    color: Colors.teal[100],
                    fontSize: 18.0,
                  letterSpacing: 6.0
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "+923301234567",
                      style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 13.0
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),

                    title: Text(
                      "xyz012345@gmail.com",
                      style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 13.0
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



