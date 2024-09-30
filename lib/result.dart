import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAns});
  final List<String> chosenAns;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < summary.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numcorrectQuestions = summaryData.where((data) {
      return data['user_answers'] == data['correct_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'you have answered $numcorrectQuestions and $numTotalQuestions questions correctly',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(summaryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed:onRestart,
                    child: const Text(
                      'Restart Quiz!',
                      style:
                          TextStyle(color: Color.fromARGB(148, 255, 255, 255)),
                    ))
              ],
            )));
  }
}
