import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';
import '../screens/exam_details.dart';

class ExamListCard extends StatelessWidget {
  final Exam exam;
  final bool isPast;

  const ExamListCard({
    super.key,
    required this.exam,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: isPast ? Colors.red[50] : Colors.blue[100],
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExamDetails(exam: exam),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.book,
                  color: isPast ? Colors.redAccent : Colors.blueAccent,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam.subject,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isPast ? Colors.grey[700] : Colors.blueAccent[900],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            DateFormat('dd.MM.yyyy – HH:mm').format(exam.date),
                            style: TextStyle(
                              color: isPast ? Colors.grey[600] : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.meeting_room, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            exam.rooms.join(', '),
                            style: TextStyle(
                              color: isPast ? Colors.grey[600] : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
