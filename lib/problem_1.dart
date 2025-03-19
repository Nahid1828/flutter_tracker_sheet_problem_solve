import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Nahid's First App")),
          backgroundColor: const Color.fromARGB(255, 147, 230, 5),
        ),
        body: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 31, 114, 239),
              fontFamily: 'DMSans',
            ),
          ),
        ),
      ),
    );
  }
}
