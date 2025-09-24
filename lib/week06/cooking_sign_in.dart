import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class CookingSignIn extends StatelessWidget {
  const CookingSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/baking.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'sign in'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'sign up'.toUpperCase(),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.grey[600],fontSize: 18),
                      icon: Icon(Icons.alternate_email, color: primaryColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[600],fontSize: 18),
                      icon: Icon(Icons.lock_open, color: primaryColor),
                    ),
                  ),Spacer(),
                  Row(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.grey.shade600),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.android, color: Colors.grey[600]),
                        ),
                      ),SizedBox(width: 10),
                      Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.grey.shade600),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chat, color: Colors.grey[600]),
                        ),
                      ),
                      Spacer(),
                      Ink(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: primaryColor,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward, color: bgColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
