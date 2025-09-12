import 'package:flutter/material.dart';
import 'dart:math';

class RandomBgDemo extends StatefulWidget {
  const RandomBgDemo({super.key});

  @override
  State<RandomBgDemo> createState() => _RandomBgDemoState();
}

class _RandomBgDemoState extends State<RandomBgDemo> {
   Color _backgroundColor = Colors.blue;
   final Random _random = Random();
void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        _random.nextInt(256), // Red
        _random.nextInt(256), // Green
        _random.nextInt(256), // Blue
        1.0, // Opacity
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: ElevatedButton(
          onPressed: _changeColor,
          child: Text('Change Color'),
        ),
      ),
    );
  }
}