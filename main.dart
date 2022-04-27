import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'type': 'text',
      'questionText': 'What does the study of an existing system refer to? ',
      'answers': ['Details of DFD', 'Feasibility Study', 'System Analysis', 'System Planning'],
      'score': ['10', '10', '10', '10'],
    },
    {
      'type': 'text',
      'questionText': 'Which is part of the systems development life cycle (SDLC)?',
      'answers': ['System Design', 'Coding', 'System Testing', 'Preliminary Investigation and Analysis'],
      'score': ['5', '3', '2', '8'],
    },
    {
      'type': 'text',
      'questionText': 'What does RAD stand for?',
      'answers': ['Rapid Application Document', 'Rapid Application Development', 'Relative Application Development', 'None of the above'],
      'score': ['1', '1', '1', '1'],
    },
    {
      'type': 'text',
      'questionText': 'How many gigs are in a petabyte? ',
      'answers': ['10', '10000', '100', '1000000'],
      'score': ['1', '1', '1', '1'],
    },
    {
      'type': 'text',
      'questionText': 'Which of the follow has been credited for inventing the internet? ',
      'answers': ['Tim Berners-Lee', 'Larry Page', 'Larry Ellison', 'Alan Turing'],
      'score': ['1', '1', '1', '1'],
    },
    {
      'type': 'text',
      'questionText': 'Term referring to the ability of neural networks in the brain to change through growth and reorganization: ',
      'answers': ['Neuroplasticity', 'Multilingualism', 'ADHD', 'Hyperfocus'],
      'score': ['1', '1', '1', '1'],
    },
    {
      'type': 'text',
      'questionText': 'How many gigs are in terabyte?',
      'answers': ['1000', '100', '10', '10000'],
      'score': ['1', '1', '1', '1'],
    },
    {
      'type': 'text',
      'questionText': ' What year was the world wide wide invented?',
      'answers': ['1989', '1979', '1969', '1959'],
      'score': ['1', '1', '1', '1'],
    },
    {
      'type': 'video',
      'questionText': 'video1',
      'answers': ['Variable Fonts', 'CSS', 'Weight', 'New York font'],
      'score': ['1', '1', '1', '1'],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  var score = 0;


  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;

    });
  }
  void _answerQuestion() {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;
    setState(() {
      print('We have more questions!');
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    //var dummy = const ['Hello'];
    // dummy.add('Max');
    //print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learning Stack Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}