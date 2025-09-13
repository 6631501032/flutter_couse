import 'dart:math';

import 'package:flutter/material.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  TextEditingController Gnum = TextEditingController();
  int life = 3;
  int Rnum = Random().nextInt(10);
  bool isWin = false;
  String message = '';
  void guess() {
    int? guess = int.tryParse(Gnum.text);
    Gnum.clear();
    if (guess == null || guess < 0 || guess > 9) {
      setState(() => message = 'Wrong inputs');
      return;
    }
    setState(() {
      if (guess == Rnum) {
        message = 'Correct, you win!';
        isWin = true;
      } else if (--life == 0) {
        message = 'Sorry, you lose. The answer is $Rnum';
      } else {
        message = guess < Rnum
            ? '$guess is too small, $life chance(s) left!'
            : '$guess is too large, $life chance(s) left!';
      }
    });
  }

  void replay() {
    setState(() {
      Rnum = Random().nextInt(10);
      life = 3;
      message = '';
      isWin = false;
      Gnum.clear();
    });
  }

  @override
  void dispose() {
    Gnum.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Guess a number game',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: Gnum,
                decoration: InputDecoration(hintText: 'Guess a number 0-9'),
              ),
              Text(message, style: TextStyle(color: Colors.red)),
              if (life > 0 && !isWin)
                ElevatedButton(onPressed: guess, child: const Text('Guess')),
              if (life == 0 || isWin)
                ElevatedButton(onPressed: replay, child: const Text('Replay')),
            ],
          ),
        ),
      ),
    );
  }
}
