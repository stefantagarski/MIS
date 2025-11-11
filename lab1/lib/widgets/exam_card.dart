import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    required this.exam,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;
    final cardColor = isPast ? Colors.grey[300] : Colors.blue[50];
    final textColor = isPast ? Colors.grey[600] : Colors.black87;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: textColor),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('dd.MM.yyyy').format(exam.dateTime),
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: textColor),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('HH:mm').format(exam.dateTime),
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: textColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(fontSize: 14, color: textColor),
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