import 'package:flutter/material.dart';

class SimpleSummationApp extends StatefulWidget {
  const SimpleSummationApp({super.key});

  @override
  State<SimpleSummationApp> createState() => _SimpleSummationAppState();
}

class _SimpleSummationAppState extends State<SimpleSummationApp> {
  TextEditingController tcn1 = TextEditingController();
  TextEditingController tcn2 = TextEditingController();
  String result = '';
  void sum() {
    int? n1 = int.tryParse(tcn1.text);
    int? n2 = int.tryParse(tcn2.text);

    setState(() {
      result = (n1 == null || n2 == null)
          ? 'Incorrect input'
          : 'Result = ${n1 + n2}';
    });
  }

  void clear() => setState(() {
    tcn1.clear();
    tcn2.clear();
    result = '';
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tcn1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'First number'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text('+', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: tcn2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Second number'),
                    ),
                  ),
                ],
              ),SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: sum,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Calculate'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: clear,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Clear'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(result,style: TextStyle(color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}
