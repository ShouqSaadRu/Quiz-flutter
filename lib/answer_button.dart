import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //cuz i have no state to be managed inside these buttons
  const AnswerButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal:
                    40), //vertical for top and buttom and horizontal for left and right
            backgroundColor: const Color.fromARGB(255, 254, 62, 4),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(
          answerText,
          textAlign: TextAlign.center, //to make answers in the center of button
        ));
  }
}
