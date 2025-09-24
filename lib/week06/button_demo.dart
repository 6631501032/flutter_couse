import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  Widget createIconButton() {
    return OverflowBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            debugPrint('icon button');
          },
          icon: Icon(Icons.volume_up, color: Colors.red),
        ),
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.blue,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.android, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget createOutlineButton() {
    return OverflowBar(
      children: [
        OutlinedButton(onPressed: () {}, child: Text('OutlineButton')),

        SizedBox(width: 8),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            backgroundColor: Colors.amber,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
          child: Text('OutlineButton'),
        ),
      ],
    );
  }

  Widget createButton() {
    return OverflowBar(
      children: [
        TextButton(onPressed: () {}, child: Text('Text button')),
        ElevatedButton(onPressed: () {}, child: Text('Elevated button')),
        FilledButton(onPressed: () {}, child: Text('Filled button')),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          child: Text('Filled button'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            createIconButton(),
            Divider(),
            createOutlineButton(),
            Divider(),
            createButton(),
          ],
        ),
      ),
    );
  }
}
