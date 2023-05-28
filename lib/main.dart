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
    sum = 0;
    outMessage = 'Playing';
  }

  void generateRandomNumber(int userinputClick) {
    setState(() {
      userinput = userinputClick;
      isGameOver = false;
      if (userinput == 0) {
        reset();
      }
      randomNumber = Random().nextInt(6) + 1;
      if (userinput == randomNumber) {
        outMessage = 'Out';
        player1Score = sum;
        finalScores.add(player1Score);
        sum = 0;
        isGameOver = true;
      } else {
        outMessage = 'Score';
        sum += userinput;
        player1Score = sum;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hand Cricket with computer'),
        ),
        body: Center(
          child: Column(
            children: [
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
                  Text(' || 💻 : $randomNumber'),
                ],
              ),
              ElevatedButton(
                onPressed: () => generateRandomNumber(0),
                child: const Text('Reset'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 2; i++)
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => generateRandomNumber(i),
                        child: Text('$i Run'),
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 3; i <= 4; i++)
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => generateRandomNumber(i),
                        child: Text('$i Run'),
                      ),
                    ),
                ],
              ),
              ElevatedButton(
                onPressed: () => generateRandomNumber(6),
                child: const Text('6 Run'),
              ),
              SizedBox(height: 20),
              Text(
                'Some Last Match Scores',
                style: TextStyle(fontSize: 18),
              ),
              ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: finalScores.length,
                itemBuilder: (BuildContext context, int index) {
                  int score = finalScores[index];
                  return ListTile(
                    title: Center(child: Text('Score: $score')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
