import 'package:flutter/material.dart';
import 'backwithdata_2.dart';

class Backwithdata1 extends StatefulWidget {
  const Backwithdata1({super.key});

  @override
  State<Backwithdata1> createState() => _Backwithdata1State();
}

class _Backwithdata1State extends State<Backwithdata1> {
    String result = 'What is your name?';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(result),
            FilledButton(
              child: const Text('Next'),
              onPressed: () async {
                // Jump to the second route and wait for returning data
                result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Backwithdata2();
                    },
                  ),
                );
                setState(() {
                  result = 'Hello $result';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
