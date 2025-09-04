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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tcName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input your name',
                suffixIcon: IconButton(
                  onPressed: tcName.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: tcName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input your name',
                suffixIcon: IconButton(
                  onPressed: tcName.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          // SizedBox(height: 16,),
          ElevatedButton(onPressed: updateMessage, child: Text('OK')),
          SizedBox(height: 16),
          Text(message),
        ],
      ),
    );
  }
}
