import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _RandomNumberAppState createState() => _RandomNumberAppState();
}

class _RandomNumberAppState extends State<MyApp> {
  int randomNumber = 0;
  int sum = 0;
  String outMessage = 'Playing';
  int userinput = 0;
  int player1Score = 0;
  bool isGameOver = false;
  List<int> finalScores = [];
  void reset() {
    // randomNumber = 0;
    sum = 0;
    outMessage = 'Playing';
    //userinput = 0;
    //player1Score = 0;
  }

  void generateRandomNumber(int userinputClick) {
    setState(() {
      userinput = userinputClick;
      isGameOver = false;
      if (userinput == 0) {
        reset();
      }
      randomNumber = Random().nextInt(7);
      if (randomNumber == 0) {
        randomNumber = randomNumber + 1;
      }
      if (randomNumber == 5) {
        randomNumber = randomNumber - 1;
      }
      if (userinput == randomNumber) {
        outMessage = 'Out';
        player1Score = sum;
        finalScores.add(player1Score);
        sum = 0;
        isGameOver = true;
        //reset();
      }
      if (userinput != randomNumber) {
        outMessage = 'Score';
        sum = sum + userinput;
        player1Score = sum;
        //reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hand Cricket with computer',
          ),
        ),
        body: Center(
          child: Column(children: [
            if (isGameOver)
              Text(
                'Game Over\nFinal Score: $player1Score ',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            if (!isGameOver) Text('Score : $player1Score '),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('👨‍🦱 : $userinput'),
                Text(' || 💻 : $randomNumber')
              ],
            ),
            // Text(
            //   '\n\n\nPlayer 1 : $player1Score \n\nUser HIT 👨‍🦱 : $userinput \nComputer Guess💻 : $randomNumber \nTotal Score = $sum \nstatus = $outMessage\n\n\n\n',
            // ),
            ElevatedButton(
                onPressed: () => generateRandomNumber(0),
                child: const Text('Reset')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () => generateRandomNumber(1),
                      child: const Text('1 Run')),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () => generateRandomNumber(2),
                      child: const Text('2 Run')),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () => generateRandomNumber(3),
                      child: const Text('3 Run')),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () => generateRandomNumber(4),
                      child: const Text('4 Run')),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () => generateRandomNumber(6),
                child: const Text('6 Run')),
            Text('Some Last Match Scores $finalScores'),
          ]),
        ),
      ),
    );
  }
}
