import 'package:flutter/material.dart';

class CreateItems extends StatefulWidget {
  const CreateItems({super.key});

  @override
  State<CreateItems> createState() => _CreateItemsState();
}

class _CreateItemsState extends State<CreateItems> {
  final List fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe to Delete & Undo')),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 8),
            child: FilledButton.icon(
              onPressed: () {
                setState(() {
                  fruit.add({'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'});
                });
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fruit.length,
              itemBuilder: (context, index) {
                final item = fruit[index]; // เก็บข้อมูลปัจจุบันไว้ใช้

                return Dismissible(
                  // 1. Key ต้องไม่ซ้ำกัน (ใช้ชื่อเป็น Key ชั่วคราว)
                  key: Key(item['name'].toString() + index.toString()),

                  // // 2. background: สีพื้นหลังตอนปัด (สีแดง + ถังขยะ)
                  // background: Container(
                  //   color: Colors.red,
                  //   alignment: Alignment.centerRight,
                  //   padding: const EdgeInsets.only(right: 20),
                  //   child: const Icon(
                  //     Icons.delete,
                  //     color: Colors.white,
                  //     size: 30,
                  //   ),
                  // ),

                  // // กำหนดทิศทางว่าปัดทางไหนถึงจะลบ (EndToStart คือขวาไปซ้าย)
                  // direction: DismissDirection.endToStart,
                  // 1. เปลี่ยนทิศทางเป็น "ซ้ายไปขวา"
                  direction: DismissDirection.startToEnd,

                  // 2. ปรับ Background ให้ไอคอนอยู่ชิดซ้าย
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft, // เปลี่ยนเป็นชิดซ้าย
                    padding: const EdgeInsets.only(
                      left: 20,
                    ), // เว้นระยะจากขอบซ้าย
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  // 3. onDismissed: ทำงานเมื่อปัดจนหลุดจอ
                  onDismissed: (direction) {
                    // เก็บข้อมูลที่กำลังจะลบไว้ก่อน เผื่อ Undo
                    final deletedItem = item;
                    final deletedIndex = index;

                    // ลบข้อมูลออกจาก List
                    setState(() {
                      fruit.removeAt(index);
                    });

                    // 4. แสดง SnackBar พร้อมปุ่ม Undo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Deleted ${deletedItem['name']}"),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // กู้คืนข้อมูลกลับมาที่ตำแหน่งเดิม
                            setState(() {
                              fruit.insert(deletedIndex, deletedItem);
                            });
                          },
                        ),
                        duration: const Duration(seconds: 3), // เวลาแสดงผล
                      ),
                    );
                  },

                  // ส่วนแสดงผลปกติ (Card)
                  child: Card(
                    child: ListTile(
                      title: Text(fruit[index]['name']),
                      subtitle: Text('${fruit[index]['price']} baht'),
                      leading: Image.asset(
                        'assets/images/fruit/${fruit[index]['image']}',
                        height: 50,
                        width: 50,
                        errorBuilder: (ctx, err, stack) =>
                            const Icon(Icons.image),
                      ),
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
