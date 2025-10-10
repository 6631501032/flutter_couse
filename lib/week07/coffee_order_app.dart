import 'package:flutter/material.dart';

class CoffeeOrderApp extends StatefulWidget {
  const CoffeeOrderApp({super.key});

  @override
  State<CoffeeOrderApp> createState() => _CoffeeOrderAppState();
}

class _CoffeeOrderAppState extends State<CoffeeOrderApp> {
  bool sw = false;
  double sd = 0;
  List coffee = ['Hot', 'none'];
  void typeswitch(bool? type) {
    setState(() {
      sw = type!;
      coffee[0] = sw ? 'Cold' : 'Hot';
    });
  }

  void sugarlevel(double? level) {
    setState(() {
      sd = level!;
      coffee[1] = sd == 2
          ? 'normal'
          : sd == 1
          ? 'less'
          : 'none';
    });
  }

  void showOrder() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Text('${coffee[0]} coffee with ${coffee[1]} sugar'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Your Order', style: TextStyle(fontSize: 24)),
            Row(
              children: [
                Text('Type'),
                Spacer(),
                Text('Hot'),
                Switch(value: sw, onChanged: typeswitch),
                Text('Cold'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sugar level'),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 2,
                    divisions: 2,
                    label: coffee[1],
                    value: sd,
                    onChanged: sugarlevel,
                  ),
                ),
                Text('Normal'),
              ],
            ),
            SizedBox(height: 10),
            FilledButton(
              onPressed: showOrder,
              child: Text('order'.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
