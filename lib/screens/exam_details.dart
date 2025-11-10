import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_details_card.dart';

class ExamDetails extends StatelessWidget {
  final Exam exam;

  const ExamDetails({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.date.difference(now);
    if (diff.isNegative) return "Испитот е завршен";
    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Детали")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ExamDetailsCard(
          exam: exam,
          timeUntilExam: timeUntilExam(),
        ),
      ),
    );
  }
}
