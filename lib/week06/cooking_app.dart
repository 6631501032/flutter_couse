import 'package:flutter/material.dart';

class CookingApp extends StatelessWidget {
  const CookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF7FF),
      appBar: AppBar(
        title: Text('Cooking Recipes', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6750A4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Papaya Salad',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),textAlign: TextAlign.center,
            ),
        SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6750A4)),
                    ),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ducimus in modi illo ad ipsa non officiis. placeat necessitatibus in aliquid ullam quasi porro vel dolores, dignissimos quisquam aspernatur.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Image.asset('assets/images/salad.jpg'),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 30),
                          Icon(Icons.star, color: Colors.amber, size: 30),
                          Icon(Icons.star, color: Colors.amber, size: 30),
                          Icon(Icons.star, color: Colors.amber, size: 30),
                          Icon(Icons.star, color: Colors.black, size: 30),
                        ],
                      ),
                      Text('3128 reviews'),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.timelapse, color: Colors.brown),
                              SizedBox(height: 4),
                              Text(
                                "PREP:",
                                style: TextStyle(color: Colors.brown),
                              ),
                              Text(
                                "5 mins",
                                style: TextStyle(color: Colors.brown),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.timer_sharp, color: Colors.red),
                              SizedBox(height: 4),
                              Text(
                                "COOK:",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                "10 mins",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.dining_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(height: 4),
                              Text("FEEDS:"),
                              Text("1-3"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
