import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_list_card.dart';

class ExamList extends StatelessWidget {
  const ExamList({super.key});

  List<Exam> getExams() {
    return [
      Exam(subject: 'Мобилни информациски системи',
          date: DateTime(2026, 1, 15, 10, 0),
          rooms: ['Лаб 13', 'Лаб 12']),
      Exam(subject: 'Калкулус',
          date: DateTime(2024, 1, 18, 12, 0),
          rooms: ['B2.1']),
      Exam(subject: 'Веб базирани системи',
          date: DateTime(2026, 1, 20, 9, 30),
          rooms: ['Лаб 138']),
      Exam(subject: 'Бази на податоци',
          date: DateTime(2025, 1, 22, 14, 0),
          rooms: ['Лаб 3']),
      Exam(subject: 'Компјутерски мрежи и безбедност',
          date: DateTime(2024, 1, 28, 8, 30),
          rooms: ['Лаб 2']),
      Exam(subject: 'Веб програмирање',
          date: DateTime(2025, 1, 21, 11, 0),
          rooms: ['Лаб 200АБ', 'Лаб 200В']),
      Exam(subject: 'Алгоритми и податочни структури',
          date: DateTime(2024, 2, 4, 10, 30),
          rooms: ['Лаб 215']),
      Exam(subject: 'Објектно ориентирано програмирање',
          date: DateTime(2025, 2, 7, 9, 0),
          rooms: ['Лаб 3']),
      Exam(subject: 'Вештачка интелегенција',
          date: DateTime(2024, 2, 10, 12, 30),
          rooms: ['B3']),
      Exam(subject: 'Биоинформатика',
          date: DateTime(2026, 1, 12, 13, 0),
          rooms: ['117']),
    ]..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context) {
    final exams = getExams();
    final timeNow = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 221233"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                final isPast = exam.date.isBefore(timeNow);

                return ExamListCard(exam: exam, isPast: isPast);
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Вкупно испити: ${exams.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
