import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  const TabDemo({super.key});

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> {
  String msg = 'Home';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab demo'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: msg),
              Tab(icon: Icon(Icons.train), text: 'Train'),
              Tab(icon: Icon(Icons.bike_scooter), text: 'Bike'),
            ],
          ),
        ),bottomNavigationBar: Container(color: Colors.lightGreenAccent,child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.train), text: 'Train'),
              Tab(icon: Icon(Icons.bike_scooter), text: 'Bike'),
            ],
          )),
        body: TabBarView(
          children: [
            Container(color: Colors.yellow, child: Text(msg)),
            Container(color: Colors.red, child: Icon(Icons.abc_outlined)),
            Container(
              color: Colors.blue,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    msg = 'Changed!';
                  });
                },
                child: Text('data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
