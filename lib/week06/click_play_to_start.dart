import 'dart:async';
import 'package:flutter/material.dart';

class ClickPlayToStart extends StatefulWidget {
  const ClickPlayToStart({super.key});

  @override
  State<ClickPlayToStart> createState() => _ClickPlayToStartState();
}

class _ClickPlayToStartState extends State<ClickPlayToStart> {
  double time = 1;
  int click = 0;
  Timer? timer;
  bool start = false;

  void startGame() {
    timer?.cancel();
    setState(() {
      time = 1;
      click = 0;
      start = true;
    });
    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        time -= 0.01;
        if (time <= 0) {
          time = 0;
          start = false;
          timer?.cancel();
        }
      });
    });
  }

  void addClick() {
    if (start && time > 0) {
      setState(() {
        click++;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(time.toStringAsFixed(2), style: TextStyle(color: Colors.red)),
            Text('Click = $click', style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: addClick,
                  label: Text('Click'),
                  icon: Icon(Icons.touch_app, color: Colors.white),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: startGame,
                  label: Text('Play', style: TextStyle(color: Colors.red)),
                  icon: Icon(Icons.refresh, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
