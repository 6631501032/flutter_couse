import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String message = '';
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  void calculate(String cal) {
    setState(() {
      String t1 = num1.text.trim(), t2 = num2.text.trim();
      double? a = double.tryParse(t1), b = double.tryParse(t2);
      if (t1.isEmpty || t2.isEmpty) {
        message = 'Please input both numbers';
        return;
      }
      if (a == null || b == null) {
        message = 'Please input only numbers';
        return;
      }
      if (cal == 'clear') {
        num1.clear();
        num2.clear();
        message = '';
        return;
      }
      message = cal == 'sum'
          ? 'Result = ${a + b}'
          : 'Result = ${pow(a, b).toDouble()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        elevation: 3,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Number 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Number 2'),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => calculate('sum'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.white,
            ),
            child: const Text('Sum'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => calculate('power'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Power'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => calculate('clear'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear'),
          ),
          SizedBox(height: 20),
          Text(message, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
