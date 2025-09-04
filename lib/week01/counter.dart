import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // state variable
  String message = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Text(message),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // debugPrint(message);
          // แบบที่ 1
          setState(() {
            message = (message == 'Hello') ? 'Hi' : 'Hello';
          });
          // แบบที่ 2
          // message = 'Hi';
          // setState(() {});
        },
        child: Text('kot ha mae'),
      ),
    );
  }
}
