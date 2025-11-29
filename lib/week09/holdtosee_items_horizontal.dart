import 'package:flutter/material.dart';

class CreateItems extends StatefulWidget {
  const CreateItems({super.key});

  // ListView data
  @override
  State<CreateItems> createState() => _CreateItemsState();
}

// --- 2. แยกฟังก์ชัน Dialog ออกมา (เขียนครั้งเดียว ใช้ได้ทุกหน้า) ---
void showFruitDialog(BuildContext context, Map item) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(item['name']),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/fruit/${item['image']}',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image, size: 20, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            'Price: ${item['price']} Baht',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

class _CreateItemsState extends State<CreateItems> {
  final List fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
  ];

  @override
  Widget build(BuildContext context) {
    int displayCount = fruit.length > 5 ? 6 : fruit.length;
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Demo')),
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

          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayCount,
              itemBuilder: (context, index) {
                if (fruit.length > 5 && index == 5) {
                  return GestureDetector(
                    onTap: () {
                      // ไปหน้า All Items
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllItemsPage(fruits: fruit),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 40,
                            color: Colors.blue,
                          ),
                          Text(
                            "See More",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container(
                  width: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    // --- ใช้ GestureDetector ตรงนี้ ---
                    child: GestureDetector(
                      // เมื่อกดค้าง: เรียกฟังก์ชันลบ
                      onLongPress: () {
                        showFruitDialog(context, fruit[index]);
                      },
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Selected: ${fruit[index]['name']}"),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/fruit/${fruit[index]['image']}',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                          Text(
                            fruit[index]['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${fruit[index]['price']} baht'),
                          const SizedBox(height: 10),
                          const Text(
                            "(Hold to see detail)", // บอก User หน่อยว่ากดค้าง
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          const SizedBox(height: 5),
                        ],
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

// ------------------- หน้า All Items -------------------
class AllItemsPage extends StatelessWidget {
  final List fruits;
  const AllItemsPage({super.key, required this.fruits});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Items")),
      body: ListView.separated(
        itemCount: fruits.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = fruits[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text('${item['price']} Baht'),
            trailing: Image.asset(
              'assets/images/fruit/${item['image']}',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image, size: 20, color: Colors.grey),
            ),
            onTap: () => showFruitDialog(context, item),
          );
        },
      ),
    );
  }
}
