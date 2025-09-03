import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText('Character List 1'),
            StyledHeading('Character list 2'),
            StyledTitle('Character list 3'),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppColors.primaryColor),
              onPressed: () {},
              child: Text('Create new'),
            )
          ],
        ),
      ),
    );
  }
}
