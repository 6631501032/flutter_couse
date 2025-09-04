import 'package:flutter/material.dart';

class GetinputDemo extends StatefulWidget {
  const GetinputDemo({super.key});

  @override
  State<GetinputDemo> createState() => _GetinputDemoState();
}

class _GetinputDemoState extends State<GetinputDemo> {
  String message = '';
  void updateMessage(String str) {
    setState(() {
      message = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Demo')),
      body: Column(
        children: [
          TextField(onChanged: (String str) => updateMessage(str)),
          Text(message),
        ],
      ),
    );
  }
}
