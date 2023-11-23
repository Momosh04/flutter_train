// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  int score;
  FinishPage({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finish")),
      body: Center(
          child: Text(
        "$score",
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
