import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double slider1 = 0.5;
  double slider2 = 0;
  void updateslider1(double? value) {
    setState(() {
      slider1 = value!;
    });
  }
  void updateslider2(double? value) {
    setState(() {
      slider2 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Default Slider, value: $slider1'),
            Slider(
              value: slider1,
              divisions: 10,
              label: slider1.toString(),
              onChanged: updateslider1,
            ),SizedBox(height: 20,),
            Text('Custom Slider, value: $slider2'),
            Slider(
              min: 0,max: 100,
              value: slider2,
              divisions: 5,
              label: slider2.round().toString(),
              onChanged: updateslider2,
            ),
          ],
        ),
      ),
    );
  }
}
