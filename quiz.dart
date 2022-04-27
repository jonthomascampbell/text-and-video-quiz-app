import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback
      answerQuestion; //from Voidcall, replaced w/ Function then removed int

  Quiz({
    required this.questions, //fixed error by removing the @ before required
    required this.answerQuestion, //fixed error by removing the @ before required
    required this.questionIndex, //fixed error by removing the @ before required
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]["questionText"],
            questions[questionIndex]["type"]),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
