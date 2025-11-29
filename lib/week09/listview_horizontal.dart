import 'package:flutter/material.dart';


class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal ListView'),
      ),
      body: SizedBox(height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 160.0,
              color: Colors.red,
            ),
            Container(
              width: 160.0,
              color: Colors.blue,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

