import 'package:flutter/material.dart';

class PageviewDemo extends StatelessWidget {
  PageviewDemo({super.key});
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            Container(color: Colors.red, child: Text('data1')),
            Container(color: Colors.green, child: Text('data1')),
            Container(color: Colors.yellow, child: Text('data1')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.jumpToPage(1);
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
