import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton({required this.answers, required this.taptap, super.key});
  final String answers;
  final void Function() taptap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: taptap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            backgroundColor: const Color.fromARGB(207, 255, 255, 255),
            foregroundColor: const Color.fromARGB(255, 21, 107, 151),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
        child: Text(
          answers,
          textAlign: TextAlign.center,
        ));
  }
}
