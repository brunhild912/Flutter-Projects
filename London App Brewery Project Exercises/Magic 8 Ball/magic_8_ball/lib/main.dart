import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Magic 8 Ball'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Magic8BallPage(),
      ),
    ),
  );
}

class Magic8BallPage extends StatefulWidget {
  @override
  _Magic8BallPageState createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage>{

  int imageNumber = 1;
  void changeImageNumber(){
    setState(() {
      imageNumber = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TextButton(
            onPressed: (){
              changeImageNumber();
            },
            child: Image.asset('images/ball$imageNumber.png'),
          ),
        ],
      ),
    );
  }

}