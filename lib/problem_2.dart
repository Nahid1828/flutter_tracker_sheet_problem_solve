import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _displayText = "Hi, Welcome to Nahid's App";

  void _changeText() {
    setState(() {
      _displayText = "Button Pressed!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Stateful Widget"),
          backgroundColor: const Color.fromARGB(255, 59, 180, 182),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_displayText, style: TextStyle(fontSize: 20)),
              ElevatedButton(onPressed: _changeText, child: Text("Press Here")),
            ],
          ),
        ),
      ),
    );
  }
}
