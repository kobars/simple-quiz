import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'Bahasa pemrograman apa yang banyak digunakan untuk machine learning?',
      'answers': [
        {'text': 'Python', 'score': 10},
        {'text': 'Go', 'score': 0},
        {'text': 'C++', 'score': 0},
        {'text': 'Java', 'score': 0},
      ],
    },
    {
      'questionText':
          'Bahasa pemrograman apa yang banyak digunakan untuk Big Data?',
      'answers': [
        {'text': 'Javascript', 'score': 0},
        {'text': 'Java', 'score': 10},
        {'text': 'Go', 'score': 0},
        {'text': 'Pascal', 'score': 0},
      ],
    },
    {
      'questionText': 'Type data mana yang tidak terdapat di Dart?',
      'answers': [
        {'text': 'List', 'score': 0},
        {'text': 'int', 'score': 0},
        {'text': 'double', 'score': 0},
        {'text': 'text', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo Quiz App'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _resetQuiz,
          tooltip: 'Increment Counter',
          child: Icon(Icons.refresh),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
