import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});
  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [Text(character)],
        ),
      ),
    );
  }
}
