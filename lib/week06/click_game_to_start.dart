import 'dart:async';
import 'package:flutter/material.dart';

class ClickGameToStart extends StatefulWidget {
  const ClickGameToStart({super.key});

  @override
  State<ClickGameToStart> createState() => _ClickGameToStartState();
}

class _ClickGameToStartState extends State<ClickGameToStart> {
  double time = 1;
  int click = 0;
  Timer? timer;
  void start() {
    if (time <= 0) return;
    setState(() => click++);
      timer ??= Timer.periodic(Duration(milliseconds: 10), (t) {
        setState(() {
          time -= 0.01;
          if (time <= 0) {
            time = 0;
            t.cancel();
            timer = null;
          }
        });
      });
  }

  void reset() {
    timer?.cancel();
    timer = null;
    setState(() {
      time = 1;
      click = 0;
    });
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
                  onPressed: start,
                  label: Text('Click'),
                  icon: Icon(Icons.touch_app, color: Colors.white),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: reset,
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
