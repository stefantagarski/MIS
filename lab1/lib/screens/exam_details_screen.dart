import 'package:flutter/material.dart';
import '../models/exam.dart';
import "package:intl/intl.dart";

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({required this.exam, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subject), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Предмет',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exam.subject,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                      title: const Text('Датум'),
                      subtitle: Text(
                        DateFormat('EEEE, dd MMMM yyyy').format(exam.dateTime),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.access_time,
                        color: Colors.blue,
                      ),
                      title: const Text('Време'),
                      subtitle: Text(
                        DateFormat('HH:mm').format(exam.dateTime),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      title: const Text('Простории'),
                      subtitle: Text(
                        exam.rooms.join(', '),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              color: exam.isPast ? Colors.grey[300] : Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      exam.isPast ? Icons.check_circle : Icons.timer,
                      color: exam.isPast ? Colors.grey : Colors.green,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exam.isPast ? 'Статус' : 'Преостанува',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            exam.getTimeRemaining(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
