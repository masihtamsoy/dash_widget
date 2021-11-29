import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';

class CandidateTestResult extends StatefulWidget {
  CandidateTestResult({Key? key}) : super(key: key);

  @override
  _CandidateTestResultState createState() => _CandidateTestResultState();
}

class _CandidateTestResultState extends State<CandidateTestResult> {
  void _onPressed() {
    // Make api call to get test json, given by candidate
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButtonWidget(buttonText: "Test", onPressed: _onPressed);
  }
}
