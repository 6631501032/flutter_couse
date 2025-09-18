import 'dart:async';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  double count = 1;
  Timer? timer;
  void start() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        count -= 0.01;
        if (count <= 0) {
          count = 0;
          t.cancel();
        }
      });
    });
  }

  void reset() {
    timer?.cancel();
    setState(() => count = 1);
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
          children: [
            Text(count.toStringAsFixed(2), style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: start,
                  label: Text('Start'),
                  icon: Icon(Icons.play_circle),
                ),
                SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: reset,
                  label: Text('Reset'),
                  icon: Icon(Icons.restart_alt),
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
