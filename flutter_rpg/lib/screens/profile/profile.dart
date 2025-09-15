import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Basic info

            // Weapon and ability

            // Stats & skills

            // Save button
          ],
        ),
      ),
    );
  }
}
