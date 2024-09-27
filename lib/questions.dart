import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answerbutton.dart';
import 'data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});
  final void Function(String Ans) onSelectAnswer;
  @override
  State<Questions> createState() {
    return _QusetionsScreen();
  }
}

class _QusetionsScreen extends State<Questions> {
  var CurrentQuestionIndex = 0;
  void answerQuestion() {
    setState(() {
      CurrentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final firstquestion = questions[CurrentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              firstquestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(168, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //spread operator
            ...firstquestion.getSuffle().map((opp) {
              return Answerbutton(
                answers: opp,
                taptap: answerQuestion,
              );
            })
          ],
        ),
      ),
    );
  }
}
