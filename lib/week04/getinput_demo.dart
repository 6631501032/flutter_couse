import 'package:flutter/material.dart';

class GetinputDemo extends StatefulWidget {
  const GetinputDemo({super.key});

  @override
  State<GetinputDemo> createState() => _GetinputDemoState();
}

class _GetinputDemoState extends State<GetinputDemo> {
  String message = '';
  TextEditingController tcName = TextEditingController();
  void updateMessage() {
    setState(() {
      message = tcName.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Demo')),
      body: Column(
        children: [
          TextField(controller: tcName,),
          ElevatedButton(onPressed: updateMessage, child: Text('OK')),
          Text(message),
        ],
      ),
    );
  }
}
