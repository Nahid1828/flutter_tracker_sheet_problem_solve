import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const AnimatedBoxApp());
}

class AnimatedBoxApp extends StatelessWidget {
  const AnimatedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animated Box",
      debugShowCheckedModeBanner: false,
      home: const AnimatedBoxScreen(),
    );
  }
}

class AnimatedBoxScreen extends StatefulWidget {
  const AnimatedBoxScreen({super.key});

  @override
  State<AnimatedBoxScreen> createState() => _AnimatedBoxScreenState();
}

class _AnimatedBoxScreenState extends State<AnimatedBoxScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.blue;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  void _changeContainer() {
    final random = Random();

    setState(() {
      width = 100 + random.nextInt(200).toDouble();
      height = 100 + random.nextInt(200).toDouble();
      color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Box")),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeContainer,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
