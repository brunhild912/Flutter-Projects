import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(XylophonePage());
}

class XylophonePage extends StatefulWidget {
  _XylophonePageState createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage>{

  void playSound (int noteNumber){
    final player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(17, 25, 39, 2),
        appBar: AppBar(
          title: Text('XYLOPHONE'),
          backgroundColor: Color.fromRGBO(17, 25, 39, 5),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: (){
                  playSound(1);
                },
                child: Container(
                  color: Color.fromRGBO(205, 222, 238, 4),
                  width: 500,
                  height: 70,
                ),
               ),

              TextButton(onPressed: (){
                playSound(2);
              },
                  child: Container(
                    color: Color.fromRGBO(171, 199, 227, 4),
                    width: 500,
                    height: 70,
                  ),
              ),

              TextButton(onPressed: (){
                playSound(3);
              },
                child: Container(
                  color: Color.fromRGBO(136, 176, 215, 4),
                  width: 500,
                  height: 70,
                ),
              ),

              TextButton(onPressed: (){
                playSound(4);
              },
                child: Container(
                  color: Color.fromRGBO(102, 153, 204, 4),
                  width: 500,
                  height: 70,
                ),
              ),

              TextButton(onPressed: (){
                playSound(5);
              },
                child: Container(
                  color: Color.fromRGBO(68, 130, 193, 4),
                  width: 500,
                  height: 70,
                ),
              ),

              TextButton(onPressed: (){
                playSound(6);
              },
                child: Container(
                  color: Color.fromRGBO(54, 107, 161, 4),
                  width: 500,
                  height: 70,
                )
              ),

              TextButton(onPressed: (){
                playSound(7);
              },
                child: Container(
                  color: Color.fromRGBO(36,84,126, 4),
                  width: 500,
                  height: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

