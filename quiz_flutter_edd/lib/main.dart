// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:quiz_flutter_edd/initpage.dart';
import 'package:quiz_flutter_edd/question.dart';
import 'package:quiz_flutter_edd/endpage.dart';

void main() {
  //runApp(const MaterialApp(
  //debugShowCheckedModeBanner: false,
  //home: Initpage(
  //)));
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Routes()));
}

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Initpage(),
      'Quiz': (context) => Question(quiz: []),
      Endpage.routeName: (context) => Endpage(),
    });
  }
}
