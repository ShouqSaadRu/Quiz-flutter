import 'package:adv_basics/Data/Questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState(); //consturcter made by default
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen; //a variable of type widget and ? means a null variable
  var activeScreen = 'start-Screen';
  List<String> selectedAnswers = [];
  void switchScreen() {
    //down in line 41 by putting switchScreen as a value of startscreen function now we can call switchscreen function in start screen class by typing just startQuiz as a function cuz it is a function!!
    setState(() {
      //calling setState in a state class which is connected to a statefukwidget will lead to re excute the build method
      activeScreen = 'questions-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers =
        //  []; //make the list empty again to start a new quiz with no answers
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-Screen') {
      screenWidget = QuestionsScreen(
        chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(restartQuiz, selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Color.fromARGB(255, 214, 29, 29),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget //it is to transfer between screens

            ),
      ),
    );
  }
}
