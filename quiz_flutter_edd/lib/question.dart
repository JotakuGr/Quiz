// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_flutter_edd/endpage.dart';
import 'list.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.quiz});

  final List quiz;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int numberanswer = 1;
  int erro = 0;
  int correct = 0;
  int timer = 60;
  late Timer conutdownTimer;

  @override
  Widget build(BuildContext context) {
    //print('Perguntas Quiz');
    // print(questions);

    void checkanswer(int numberResult) {
      setState(() {
        if (questions[numberanswer - 1]["alternativa correta"] ==
            numberResult) {
          print('Acertou');
          correct++;
          startTimer() {}
        } else {
          print('Errou');
          erro++;
          startTimer() {}
        }
        print('Total de acertos: $correct Total de erradas: $erro');

        if (numberanswer == 15) {
         print('Fim do Jogo');
         Navigator.pushNamed(context, 'Endpage', 
              arguments: Argument(correct));
        } else {
          numberanswer++;
        }
      });
    }

    void startTimer() {
      conutdownTimer = Timer(
          Duration(seconds: 1),
          (timer) {
            setState(() {
              if (this.timer > 0) {
                this.timer--;
              } else {
                checkanswer(1);
              }
            });
          } as void Function());
    }

    void resetTimer() {
      setState(() {
        timer = 60;
      });
    }

    return SizedBox.expand(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/planet.png',
                  ),
                  fit: BoxFit.fill),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Row(children: [
                        Image.asset(
                          'assets/astronaut.png',
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(width: 10),
                        Text('Pergunta $numberanswer de 15',
                            style: TextStyle(fontSize: 20, color: Colors.amber))
                      ])),
                  Text(
                      '$numberanswer° Pergunta:\n\n' +
                          questions[numberanswer - 1]['pergunta'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Pressionado 1');
                        checkanswer(1);
                      },
                      child: Text(questions[numberanswer - 1]['resposta'][0],
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Pressionado 2');
                        checkanswer(2);
                      },
                      child: Text(questions[numberanswer - 1]['resposta'][1],
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Pressionado 3');
                        checkanswer(3);
                      },
                      child: Text(questions[numberanswer - 1]['resposta'][2],
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                    ),
                  ),
                ],
              ),
            )));
  }
}
