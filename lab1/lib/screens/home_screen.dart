import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final String indexNumber;

  const HomeScreen({
    required this.indexNumber,
    super.key,
  });

  List<Exam> _getExams() {
    return [
      Exam(
        subject: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 12, 20, 10, 0),
        rooms: ['Лаб. 138', 'Лаб 2'],
      ),
      Exam(
        subject: 'Веб програмирање',
        dateTime: DateTime(2025, 11, 22, 12, 0),
        rooms: ['Лаб 12'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateTime: DateTime(2025, 12, 25, 9, 0),
        rooms: ['Лаб 3'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(2025, 11, 27, 11, 0),
        rooms: ['Лаб 2', 'Лаб 3'],
      ),
      Exam(
        subject: 'Софтверски ориентирани архитектури',
        dateTime: DateTime(2025, 12, 29, 10, 0),
        rooms: ['Лаб 215'],
      ),
      Exam(
        subject: 'Алгоритми и податочни структури',
        dateTime: DateTime(2025, 2, 1, 13, 0),
        rooms: ['Амфитеатар 2'],
      ),
      Exam(
        subject: 'Компјутерски мрежи',
        dateTime: DateTime(2025, 2, 3, 10, 0),
        rooms: ['Лаб 1', 'Лаб 2'],
      ),
      Exam(
        subject: 'Вештачка интелигенција',
        dateTime: DateTime(2025, 2, 5, 12, 0),
        rooms: ['Амфитеатар 3'],
      ),
      Exam(
        subject: 'Дискретна математика',
        dateTime: DateTime(2025, 3, 8, 9, 0),
        rooms: ['Амфитеатар 1'],
      ),
      Exam(
        subject: 'Објектно ориентирано програмирање',
        dateTime: DateTime(2025, 9, 10, 11, 0),
        rooms: ['Лаб 3'],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final exams = _getExams()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailsScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}