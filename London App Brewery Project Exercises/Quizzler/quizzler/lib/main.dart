// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quizzler/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _QuizzlerStatePage createState() => _QuizzlerStatePage();

}

class _QuizzlerStatePage  extends State<QuizzlerApp>{

  int questionNumber = 0;

  void checkAnswer (bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {

    if (quizBrain.isFinished() == true) {
      //show an alert using rFlutter_alert,
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();

      //reset the questionNumber,
      quizBrain.reset();

      //empty out the scoreKeeper.
      scoreKeeper = [];
    }
    else {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    }
  });
  }

  List <Icon> scoreKeeper = [];

  List <Question> questionBank = [
    Question('Is Flutter a cross-platform framework for mobile app development?', true),
    Question('Does Flutter use a single codebase to build apps for both iOS and Android?', true),
    Question('Does Flutter use a virtual machine for executing apps?', false),
    Question('Is Dart the programming language used for Flutter app development?', true),
    Question('Is Flutter limited to building apps only for iOS and Android platforms?', false),
    Question('Is Flutter primarily designed for web application development?', false),
    Question('Is JavaScript the programming language used for Flutter app development?', false),
    Question('Does Flutter provide a rich set of pre-designed UI widgets?', true),
    Question('Does Flutter require separate codebases for iOS and Android app development?', false),
    Question('Are Flutter apps compiled into native code for high performance?', true),
  ];

  Question q1 = Question('Does Flutter use a virtual machine for executing apps?', false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/background.png'),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        questionBank[questionNumber].questionText,
                            textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15.0),
                        textStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        //user has picked true
                        checkAnswer(true);
                      },
                      child: Text (
                        'True',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: const BoxDecoration(
                          color:  Color.fromRGBO(138, 138, 255, 4),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15.0),
                        textStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        //The user picked false.
                        checkAnswer(false);
                      },
                      child: Text (
                        'False',
                      textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: scoreKeeper,
                ),
                  ],
                ),
            ),
          ),
        ),
    );
  }

}
