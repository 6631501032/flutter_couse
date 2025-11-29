import 'package:flutter/material.dart';
import 'drawer_demo.dart';
import 'drawer_help.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Row(
              children: [
                Image.network('https://tse4.mm.bing.net/th/id/OIP.H_QoPLADAT3GFykDCfqZiwHaEn?rs=1&pid=ImgDetMain&o=7&rm=3', width: 100),
                const Text('Header'),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DrawerDemo()),
            ),
            icon: const Icon(Icons.home),
            label: const Text('Home'),
          ),
          TextButton.icon(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DrawerHelp()),
            ),
            icon: const Icon(Icons.help),
            label: const Text('Help'),
          ),
        ],
      ),
    );
  }
}

