import 'package:adv_basics/Data/Questions.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswe, {super.key});

  final void Function(String answer) onSelectedAnswe;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswe(
        selectedAnswer); //widget. to access stateful widget and all its properity above
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double
          .infinity, //use as much width as possible note : it is like when we wrap with Center and then use mainaxisSize.min
      child: Container(
        //to add margin we have to put container
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //mainaxis in column is the vertical and row is horizintal
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //horizental axis and CrossAxisAlignment.stretch so that the buttons of answers have the same size
          children: [
            Text(
              currentQuestion
                  .text, //.text to accsess the text in question not answer if i want to accsess answer i should put it instead of text
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 223, 212, 204),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign:
                  TextAlign.center, //center the text hirizentally in the middle
            ),
            const SizedBox(
              height: 30,
            ),

            //note : map() doesn't change the order of items in a list but Shuffle does. so we need to make a cope of a list before shuffle look at quiz_questions class notice the variable ShuffeldList
            ...currentQuestion.getShuffledAnswers().map((answeeeer) {
              //children list doesn't want a list inside it (neasted list) so ... will spread the answers in the list into indevisual values
              //return the transformed answeeeer. the new value you wanna have in the list instead of the old answeeeer

              return AnswerButton(answeeeer, () {
                answerQuestion(answeeeer);
              }); //so that i convert the list of answers to a list of answers buttons
              //() {} function that should be excuted when the button is pressed
              //we are deriving(اشتقينا) AnswerButtons dynamically based on actual answers in the list of answers
            }) //it is used to convert a list of values to other value
          ],
        ),
      ),
    );
  }
}
