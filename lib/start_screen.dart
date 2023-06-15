import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const logoImage = 'assets/images/quiz-logo.png';
const logoText = 'Learn Flutter the fun way!';
const btnText = 'Start now';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     logoImage,
          //     width: 300,
          //   ),
          // ), => Avoid this method for opacity, instead do the below

          Image.asset(
            logoImage,
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255), //For opacity
          ),

          const SizedBox(height: 80),
          Text(
            logoText,
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 223, 252),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 237, 223, 252),
              textStyle:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w500),
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.arrow_forward_outlined),
            label: const Text(btnText),
            //label is used instead of child when using .icon class
          )
        ],
      ),
    );
  }
}
