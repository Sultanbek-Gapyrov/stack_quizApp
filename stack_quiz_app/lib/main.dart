import 'package:flutter/material.dart';
import 'package:stack_quiz_app/quiz_brain.dart';
import 'widgets/new_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Icon correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
    size: 45,
  );
  Icon incorrectIcon = const Icon(
    Icons.close,
    color: Colors.red,
    size: 45,
  );
  List<Icon> icons = <Icon>[];
  String suroo = '';

  @override
  void initState() {
    suroo = quizBrain.getQuestions();
    super.initState();
  }

  bool isFinished = false;

  void userAnswered(bool answer) {
    bool realAnswers = quizBrain.getAnswer();
    if (answer == realAnswers) {
      icons.add(correctIcon);
    } else {
      icons.add(incorrectIcon);
    }

    quizBrain.getNext();
    suroo = quizBrain.getQuestions();
    if (suroo == 'Suroolor buttu') {
      isFinished = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[800],
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 35,
              right: 35,
              top: 150,
              child: Text(
                suroo = quizBrain.getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 80,
              child: Wrap(
                spacing: 5,
                children: icons,
              ),
            ),
            if (isFinished == true)
              Center(
                child: newButton(
                  color: Colors.blue,
                  text: 'Again',
                  pressed: () {
                    quizBrain.restart();
                    isFinished = false;
                    quizBrain.getQuestions();
                    icons = [];
                    setState(() {});
                  },
                ),
              )
            else
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 460,
                    left: 65,
                    child: newButton(
                      text: 'True',
                      color: Colors.green,
                      // widthSize: 0.25,
                      // heightSize: 0.01,
                      pressed: () {
                        userAnswered(true);
                      },
                    ),
                  ),
                  Positioned(
                    top: 520,
                    left: 65,
                    child: newButton(
                      // widthSize: 0.24,
                      // heightSize: 0.01,
                      text: 'False',
                      color: Colors.red,
                      pressed: () {
                        userAnswered(false);
                      },
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
