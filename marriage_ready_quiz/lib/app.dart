import 'package:flutter/material.dart';
import 'features/intake/intake_screen.dart';
import 'features/quiz/quiz_screen.dart';
import 'features/results/results_screen.dart';
import 'core/theme.dart';

class MarriageReadyQuizApp extends StatelessWidget {
  const MarriageReadyQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marriage Ready Quiz',
      theme: buildTheme(),
      routes: {
        '/': (_) => const IntakeScreen(),
        '/quiz': (_) => const QuizScreen(),
        '/results': (_) => const ResultsScreen(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
