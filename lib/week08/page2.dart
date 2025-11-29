import 'package:flutter/material.dart';
import 'package:flutter_couse/week08/fruit.dart';
import 'package:flutter_couse/week08/page1.dart';

class Page2 extends StatelessWidget {
  // วิธีที่ 2
  // String name = '';
  // int price = 0;
  // List date = [];
  // // constructor
  // Page2({
  //   super.key,
  //   required this.name,
  //   required this.price,
  //   required this.date,
  // });
  // วิธีที่ 3
  Fruit fruit;
  Page2({super.key, required this.fruit});
  
  @override
  Widget build(BuildContext context) {
    // วิธีที่ 1
    // Map<String, dynamic> data =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Column(
        children: [
          // วิธีที่ 1
          // Text('Name: ${data['name']}'),
          // Text('Price: ${data['price']}'),
          // Text('date: ${data['date'][1]}'),
          // วิธีที่ 2
          // Text('Name: $name'),
          // Text('Price: $price'),
          // Text('date: ${date[0]}'),
          // วิธีที่ 3
          Text('Name: ${fruit.name}'),
          Text('Price: ${fruit.price}'),
          Text('Menufacturing date: ${fruit.date[0]}'),
          Text('Expire: ${fruit.date[1]}'),

           // วิธีที่ 1,2
          // FilledButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Text("Back"),
          // ),
          // วิธีที่ 3
          FilledButton(
            onPressed: () {

              // clear session and remove local storage
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
                (route) => false,
              );
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
    ;
  }
}
