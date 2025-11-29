
import 'package:flutter/material.dart';


class ListViewPull extends StatefulWidget {
  const ListViewPull({super.key});


  @override
  State<ListViewPull> createState() => _ListViewPullState();
}


class _ListViewPullState extends State<ListViewPull> {
  final List fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'}
  ];


  // refresh to add new item
  Future<void> refresh() async {
    // simulate a wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      fruit.add(
        {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
      );
    });
  }


  // FAB to add new item
  void add() {
    setState(() {
      fruit.add(
        {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
      ),
      body: RefreshIndicator(
        // pull to refresh
        onRefresh: refresh,
        child: ListView.builder(
          itemCount: fruit.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(fruit[index]['name']),
                subtitle: Text('${fruit[index]['price']} baht'),
                trailing: Image.asset(
                  'assets/images/fruit/${fruit[index]['image']}',
                  height: 100,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: const Icon(Icons.add),
      ),
    );
  }
}

