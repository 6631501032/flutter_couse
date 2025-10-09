import 'package:flutter/material.dart';

class CbSwDemo extends StatefulWidget {
  const CbSwDemo({super.key});

  @override
  State<CbSwDemo> createState() => _CbSwDemoState();
}

class _CbSwDemoState extends State<CbSwDemo> {
  // state variable for a checkbox / Switch
  bool cb = false;
  bool sw = false;

  // method to update a checkbox / Switch
  void updateCB(bool? value) {
    // print(value!);
    setState(() {
      cb = value!;
    });
  }
  void updateSW(bool? value) {
    // print(value!);
    setState(() {
      sw = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: cb, onChanged: updateCB),
                Text('Red'),
                SizedBox(width: 20),
                Text('Checkbox status: $cb'),
              ],
            ),
            Row(
              children: [
                Switch(value: sw, onChanged: updateSW),
                Text('Football'),
                SizedBox(width: 20),
                Text('Switch status: $sw'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
