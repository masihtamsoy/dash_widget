import 'package:dash_widget/src/countdown_timer_widget.dart';
import 'package:flutter/material.dart';

class QuizFormsCountDownWizard extends StatefulWidget {
  QuizFormsCountDownWizard({Key? key}) : super(key: key);

  @override
  _QuizFormsCountDownWizardState createState() =>
      _QuizFormsCountDownWizardState();
}

class _QuizFormsCountDownWizardState extends State<QuizFormsCountDownWizard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CountdownTimerWidget(
      durationMin: 10,
      onEnd: () {
        print("Do soemthing on end");
      },
    ));
  }
}
