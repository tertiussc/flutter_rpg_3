import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Temporary list of characters
  final List<String> characters = ['mario', 'luigi', 'peach', 'bowser', 'toad', 'bowser', 'koopa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (_, index) {
                    return Container(
                      color: Colors.grey[800],
                      padding: EdgeInsets.all(40),
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text(characters[index]),
                    );
                  }),
            ),
            StyledButton(
              onPressed: () {},
              child: StyledHeading('Create new'),
            )
          ],
        ),
      ),
    );
  }
}
