import 'package:flutter/material.dart';
import 'screens/exam_list.dart';

void main() {
  runApp(const ExamHomePage());
}

class ExamHomePage extends StatelessWidget {
  const ExamHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        useMaterial3: true,
      ),
      home: const ExamList(),
      debugShowCheckedModeBanner: false,
    );
  }
}