import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class ExamDetailsCard extends StatelessWidget {
  final Exam exam;
  final String timeUntilExam;

  const ExamDetailsCard({
    super.key,
    required this.exam,
    required this.timeUntilExam,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd.MM.yyyy – HH:mm').format(exam.date);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                exam.subject,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Датум и време: $dateFormatted",
                      style: const TextStyle(fontSize: 16),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.meeting_room, color: Colors.blueAccent),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Простории: ${exam.rooms.join(', ')}",
                      style: const TextStyle(fontSize: 16),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.access_time, color: Colors.blueAccent),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Преостанато време: $timeUntilExam",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
