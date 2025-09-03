import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';
import 'screens/home/home.dart';

void main() {
  runApp(
    MaterialApp(
      theme: PrimaryTheme,
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
