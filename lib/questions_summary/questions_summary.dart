import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary/summary.item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
 /*Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        //it takes its only child (Column)and makes it scrollable
        child: Column(
          //if it exceeds 300 it will be scroll able
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1)
                    .toString()), //as ... because it is an object so we have to tell flutter that this will be an integer
                Expanded(
                  //it can't take a width that is more than the widget above it (flex) which is in our case is Row
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['correct_answer'] as String)
                    ],
                  ),
                )
              ],
            );
          }).toList(), //cuz children wants a list of widgets not a list of map objects
        ),
      ),
    );
  }
*/
