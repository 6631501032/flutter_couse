import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // state variable

  int count = 0;
  // methods
  void update() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Count = $count',
          style: TextStyle(
            fontSize: 26,
            color: Color.fromARGB(255, 60, 255, 1),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: update,
        backgroundColor: Colors.blue,
        child: Text('kot ha mae', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
