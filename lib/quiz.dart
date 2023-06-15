import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
const List<Color> colors = [
  Color.fromARGB(255, 78, 13, 151),
  Color.fromARGB(255, 107, 15, 168),
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String ans) {
    selectedAnswers.add(ans);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
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
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAns: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAns: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: colors, begin: startAlignment, end: endAlignment),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}


/* 
  Alternative way to switch screen btw startScreen & questionsScreen
  (no need for initState() method)

    var activeScreen = 'start-screen'

    void switchScreen() {
      setState(() {
        activeScreen = 'questions-screen';
      });
    }
    ........
    child: activeScreen == 'start-screen' 
      ? StartScreen(switchScreen) 
      : const QuestionsScreen(),
      
*/
/*
  Another way - Using initState method
  (switchScreen same as above)

    Widget? activeScreen;
      //Without '?' it is non-nullable => error without initialisation

    void initState() {
      activeScreen = StartScreen(switchScreen);
      super.initState();
    }
    ........
    child: activeScreen,

*/