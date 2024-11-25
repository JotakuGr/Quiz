// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class Argument {
  int correct = 0;

  Argument(this.correct);
}

class Endpage extends StatelessWidget {
  static const routeName = 'Endpage';

  const Endpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as Argument;

    return SizedBox.expand(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/planet.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             Align(
                      alignment: Alignment.center,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/astronautHand.png',
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(width: 10),
              Text('Fim do Jodo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                  )),
                  SizedBox(width: 10),
                  Image.asset(
                          'assets/astronautHand.png',
                          width: 80,
                          height: 80,
                        ),
                  ])),
              Text("Você acertou\n${argument.correct } de 15\n perguntas",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.amber)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Quiz');
                  },
                  child:
                      Text('Jogar Novamente', style: TextStyle(fontSize: 30)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
