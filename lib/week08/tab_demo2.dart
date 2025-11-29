import 'package:flutter/material.dart';

class TabDemo2 extends StatefulWidget {
  const TabDemo2({super.key});

  @override
  State<TabDemo2> createState() => _TabDemo2State();
}

class _TabDemo2State extends State<TabDemo2> {
 int s = 840, sh = 1290;       // ราคา
  int sc = 0, shc = 0;          // จำนวน

  int get total => s * sc + sh * shc;
  int get cart => sc + shc;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shop"),
          bottom: TabBar(tabs: [
            const Tab(text: "Suit"),
            const Tab(text: "Shoe"),
            Tab(child: Badge(label: Text(cart.toString()), isLabelVisible: cart > 0, child: const Text("Cart"))),
          ]),
        ),
        body: TabBarView(children: [
          shopItem("Suit", s, "https://wallpapers.com/images/hd/professional-manin-black-suit-20oksnteqcmnbpmk.jpg",
              () => setState(() => sc++)),
          shopItem("Shoe", sh, "https://tse1.mm.bing.net/th/id/OIP.cCxWCa_-G9zVbUaNAiU0GgHaEj?rs=1&pid=ImgDetMain&o=7&rm=3",
              () => setState(() => shc++)),
          cartTab(),
        ]),
      ),
    );
  }

  Widget shopItem(name, price, img, onAdd) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Text("$name $price฿", style: const TextStyle(fontSize: 20)),
          Image.network(img, height: 280),
          const SizedBox(height: 15),
          FilledButton(onPressed: onAdd, child: const Text("ADD TO CART"))
        ]),
      );

  Widget cartTab() => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Suit x$sc = ${sc * s}฿\nShoe x$shc = ${shc * sh}฿\n\nTOTAL = $total฿",
              style: const TextStyle(fontSize: 18)),
          FilledButton(onPressed: () => setState(() => sc = shc = 0), child: const Text("DELETE ALL"))
        ]),
      );
}