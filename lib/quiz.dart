// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'questions.dart';
import 'First_Screen.dart';
import 'data/questions.dart';
import 'result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  final onRestart;
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> SelectedAns = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAns(String answer) {
    SelectedAns.add(answer);
    if (SelectedAns.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      SelectedAns = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = Questions(onSelectAnswer: chooseAns);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAns: SelectedAns,
        onRestart:restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.yellow,
                    Colors.red,
                    Colors.indigo,
                    Colors.teal,
                  ]),
            ),
            child: screenWidget
            ),
      ),
    );
  }
}
