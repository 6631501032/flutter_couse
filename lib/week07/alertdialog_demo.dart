import 'package:flutter/material.dart';

class AlertdialogDemo extends StatefulWidget {
  const AlertdialogDemo({super.key});

  @override
  State<AlertdialogDemo> createState() => _AlertdialogDemoState();
}

class _AlertdialogDemoState extends State<AlertdialogDemo> {
  String dialog = '';

  void showAlert() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Image.network('https://www.iconarchive.com/download/i7929/hopstarter/soft-scraps/Button-Warning.64.png'),
              Text('Are you sure to delete this item?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed:
                  // () {Navigator.pop(context);},
                  () => Navigator.pop(context),
              child: Text("KEEYES", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  dialog = 'You choose YES';
                });
              },
              child: Text("YES"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FilledButton(
              onPressed: showAlert,
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Delete'),
            ),Text(dialog)
          ],
        ),
      ),
    );
  }
}
