import 'package:flutter/material.dart';
import 'questions.dart';
import 'First_Screen.dart';
import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> SelectedAns = [];
  var activeScreen = 'start-screen';
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen );
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void ChooseAns(String answer) {
    SelectedAns.add(answer);
    if (SelectedAns.length == questions.length) {
      setState(() {
        SelectedAns = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = Questions(onSelectAnswer: ChooseAns);
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
            child: screenWidget),
      ),
    );
  }
}
