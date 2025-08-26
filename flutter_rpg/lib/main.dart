import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Placeholder(),
      ),
    );
  }
}
