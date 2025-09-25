// 6631501032
import 'dart:math';

import 'package:flutter/material.dart';

class Fishing extends StatefulWidget {
  const Fishing({super.key});

  @override
  State<Fishing> createState() => _FishingState();
}

class _FishingState extends State<Fishing> {
  // Fish data
  List fish = [
    {
      'name': 'AnglerFish',
      'price': 20,
      'image': 'assets/images/fish/anglerfish.png',
    },
    {
      'name': 'NeonTerTra',
      'price': 10,
      'image': 'assets/images/fish/neon-tetra.png',
    },
    {
      'name': 'Puffer',
      'price': 5,
      'image': 'assets/images/fish/puffer-fish.png',
    },
    {'name': 'Shark', 'price': 10, 'image': 'assets/images/fish/shark.png'},
  ];
  String message = '';
  int coin = 0;
  int worms = 5;
  String image = 'assets/images/fish/fisherman.png';
  final Random _random = Random();
  void showicon() {
    for (int i = 0; i < worms; i++) {
      Icon(Icons.waves_rounded);
    }
  }

  void startfishing() {
    setState(() {
      int randomfish = _random.nextInt(fish.length);
      int randomamount = _random.nextInt(10) + 1;
      if (worms == 0) {
        return;
      }
      worms--;
      coin = fish[randomfish]['price'] * randomamount;
      message = '${fish[randomfish]['name']} x $randomamount = $coin';
      image = fish[randomfish]['image'];
    });
  }

  void reset() {
    setState(() {
      coin = 0;
      worms = 5;
      image = 'assets/images/fish/fisherman.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fishing Game', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Worms: $worms')],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.currency_exchange, color: Colors.yellow),
              Text('${coin.toString()}'),
            ],
          ),
          Container(
            margin: EdgeInsets.all(8),
            width: 200,
            height: 200,
            child: Image.asset(image),
          ),
          Text(message),
          ElevatedButton(
            onPressed: startfishing,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Fishing'),
          ),

          ElevatedButton(
            onPressed: reset,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('reset'),
          ),
        ],
      ),
    );
  }
}
