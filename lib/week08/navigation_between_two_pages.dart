import 'package:flutter/material.dart';

class NavigationBetweenTwoPages extends StatelessWidget {
  const NavigationBetweenTwoPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: FilledButton(
          child: const Text('Next'),
          onPressed: () {
            // Jump to the second route
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}
// =========== Second page ============
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: FilledButton(
          onPressed: () {
            //Return to previous page (first route)
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
