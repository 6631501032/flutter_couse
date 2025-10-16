import 'package:flutter/material.dart';
import 'package:flutter_couse/week08/fruit.dart';
import 'package:flutter_couse/week08/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Container(
        alignment: Alignment.topCenter,
        child: FilledButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              // วิธีที่ 1
              // MaterialPageRoute(
              //   builder: (context) => Page2(),
              //   settings: RouteSettings(
              //     arguments: <String,dynamic>{
              //       'name': 'apple',
              //       'price': 30,
              //       'date': ['10 Oct', '19 Oct'],
              //     },
              //   ),
              // ),
              // วิธีที่ 2
              // MaterialPageRoute(
              //   builder: (context) =>
              //       Page2(name: 'apple', price: 15, date: ['10 Oct', '19 Oct']),
              // ),
              MaterialPageRoute(
                builder: (context) =>
                    Page2(fruit: Fruit('apple', 15, ['10 Oct', '19 Oct'])),
              ),
            );
          },
          child: Text("Next"),
        ),
      ),
    );
  }
}
