import 'package:flutter/material.dart';


class CreateItems extends StatefulWidget {
  const CreateItems({super.key});


  // ListView data
  @override
  State<CreateItems> createState() => _CreateItemsState();
}


class _CreateItemsState extends State<CreateItems> {
  final List fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'}
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 8),
            child: FilledButton.icon(
              onPressed: () {
                setState(() {
                  fruit.add(
                    {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
                  );
                });
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add'),
            ),
          ),
          // we wrap ListView inside Expanded to use the remaining space of Column
          // without Expanded, this cause error because both Column and ListView takes screen's height
          // see https://stackoverflow.com/questions/45669202/how-to-add-a-listview-to-a-column-in-flutter
          Expanded(
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
        ],
      ),
    );
  }
}

