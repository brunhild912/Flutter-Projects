import 'package:flutter/material.dart';

void main() {
  runApp(const AlarmoraApp());
}

class AlarmoraApp extends StatelessWidget {
  const AlarmoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarmora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B0C10),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarmora'),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: const Center(
        child: Text(
          'Welcome to Alarmora 🌌',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Coming soon: Add Alarm Category
        },
        tooltip: 'Add Category',
        child: const Icon(Icons.add),
      ),
    );
  }
}
