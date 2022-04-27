import 'package:flutter/material.dart';

import "dart:collection";

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback selectHandler; //https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct

  Result(this.resultScore, this.selectHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are ready for the exam!';
    } else if (resultScore <= 12) {
      resultText = 'You may need to study.';
    } else if (resultScore <= 16) {
      resultText = 'You need to review the chapters again';
    } else {
      resultText = 'Lets try again!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text(
              'Restart Quiz!',
            ),
            onPressed: selectHandler, //Resolved. Do not change to resetHandler deprecated.
          ),
        ],
      ),
    );
  }
}
