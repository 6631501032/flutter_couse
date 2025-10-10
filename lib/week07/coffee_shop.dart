import 'package:flutter/material.dart';

class CoffeeShop extends StatefulWidget {
  const CoffeeShop({super.key});

  @override
  State<CoffeeShop> createState() => _CoffeeShopState();
}

class _CoffeeShopState extends State<CoffeeShop> {
  var coffee = [
    {
      'name': 'Latte',
      'price': 35,
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.T3mZ6Lsv7Yhbp3lbEZNd9AHaE7?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'name': 'Americano',
      'price': 30,
      'image':
          'https://tse3.mm.bing.net/th/id/OIP.wcsbyeq3bRnCZrmLR4rhogHaEK?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
    },
    {
      'name': 'Cappuccino',
      'price': 40,
      'image':
          'https://cdn3.tmbi.com/secure/RMS/attachments/37/1200x1200/exps37407_THE1213734_37407_WEB.jpg',
    },
  ];

  int rd = 0;
  bool sw = false;
  double sd = 0;
  String dialog = '';

  String get type => sw ? 'Cold' : 'Hot';
  String get sugar => sd == 2
      ? 'Normal'
      : sd == 1
      ? 'Less'
      : 'None';
  int get total => (coffee[rd]['price'] as int) + (sw ? 5 : 0);

  void showOrder() async {
    int total = (coffee[rd]['price'] as int) + (sw ? 5 : 0);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('${coffee[rd]['image']}'),
              SizedBox(height: 10),
              Text(
                '$type ${coffee[rd]['name']} with $sugar sugar. Price = $total',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  dialog = 'Thank you for your order!';
                });
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text('Your order', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Coffee',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Coffee radio list
            ...List.generate(coffee.length, (i) {
              return Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: rd,
                    onChanged: (v) => setState(() => rd = v!),
                  ),
                  Text('${coffee[i]['name']} ${coffee[i]['price']}'),
                ],
              );
            }),

            const SizedBox(height: 10),

            // Hot/Cold switch
            Row(
              children: [
                const Text(
                  'Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Text('Hot'),
                Switch(value: sw, onChanged: (v) => setState(() => sw = v)),
                const Text('Cold(+5)'),
              ],
            ),

            const SizedBox(height: 10),

            // Sugar slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sugar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text('None'),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 2,
                    divisions: 2,
                    value: sd,
                    label: sugar,
                    onChanged: (v) => setState(() => sd = v),
                  ),
                ),
                Text('Normal'),
              ],
            ),

            const SizedBox(height: 10),

            FilledButton(onPressed: showOrder, child: const Text('ORDER')),

            const SizedBox(height: 10),
            Text(
              dialog,
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
