import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {super.key}); //Function startQuiz were implemented because of Function startQuiz in quiz class
  //Function() means that startQuiz should be a function that takes no argument cuz switchScreens in quiz class doesn't take any arguments
  final void Function() startQuiz;
  Widget build(context) {
    return Center(
        //center takes as much space as it can so it colors all the background
        child: Column(
      //we use column to put widgets above each other and row row widgets next to each other
      mainAxisSize: MainAxisSize.min, //to put the image in the middle
      children: [
        Image.asset(
          'images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(109, 255, 255,
              255), // عشان تصير الصورة شفافة كل الي سويته اخترت لون ابيض بعدين ضغطن على خانة الألوان ونزلت اللون الرصاصي للنص
        ), //width to make it smaller

        const SizedBox(
          height: 80,
        ), //for spacing between the image and the text

        Text(
          'Learn flutter the fun way !',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 28),
        ), //ترا الترتيب يفرق لو حطينا النص فوق قبل الصورة بيطلع النص أول

        const SizedBox(height: 30),

        //Icon(icon)   //i can use icon speratly in its own !

        OutlinedButton.icon(
          // .icon to have icon in the botton
          onPressed:
              startQuiz, //when the button is pressed startQuiz will be called which will lead to switchscreens which will lead to build (the job of setState())
          icon: const Icon(Icons
              .ads_click_outlined), //when you type inside of the parentheses icons it will recommend alot of icons ! it will show you an image of it
          label: const Text(
              'Start Quiz'), //instead of child here with icons we have to use label
          style: OutlinedButton.styleFrom(
            //every kind of buttons have it's own class of styling !!!!! wow
            foregroundColor: Colors.white,
          ),
        ),
      ],
    ));
  }
}
