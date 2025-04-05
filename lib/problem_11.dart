import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Image',
      home: Scaffold(
        appBar: AppBar(title: Text('Display an Image from local asset')),
        body: Center(child: Image.asset('assets/images/Nahid.jpg', width: 300)),
      ),
    );
  }
}
