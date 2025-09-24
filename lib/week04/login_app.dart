import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  String message = '';
  TextEditingController tcUsername = TextEditingController();
  TextEditingController tcPassword = TextEditingController();
  void checkLogin() {
    setState(() {
      message = (tcUsername.text == 'admin' && tcPassword.text == '1234'
          ? 'Welcome admin'
          : 'Wrong username or password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        elevation: 3,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: tcUsername,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: tcPassword,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: checkLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Login'),
          ),
          SizedBox(height: 20),
          Text(message, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
