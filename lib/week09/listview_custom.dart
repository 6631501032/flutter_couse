import 'package:flutter/material.dart';


class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom ListView'),
      ),
      body: ListView(
        children: const [
          CustomListItem(
              color: Colors.blue,
              title: 'Hit Music 2020',
              user: 'Peter',
              views: 9999),
          CustomListItem(
              color: Colors.yellow,
              title: 'Old Pop Songs',
              user: 'Mary',
              views: 15000),
          CustomListItem(
              color: Colors.green,
              title: 'Thai Folk Songs',
              user: 'Wichai',
              views: 7023),
        ],
      ),
    );
  }
}


// =========== Custom List item ============
class CustomListItem extends StatelessWidget {
  final Color color;
  final String title;
  final String user;
  final int views;


  // constructor
  const CustomListItem(
      {super.key,
      required this.color,
      required this.title,
      required this.user,
      required this.views});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: color,
              height: 60,
              margin: const EdgeInsets.only(right: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(user),
                Text('$views views'),
              ],
            ),
          ),
          const Icon(Icons.more_vert, size: 16.0),
        ],
      ),
    );
  }
}

