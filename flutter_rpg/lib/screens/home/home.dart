import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/screens/home/create/create.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Initialise data
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharacterOnce();
    super.initState();
  }

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
              child: Consumer<CharacterStore>(builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: ValueKey(value.characters[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(context, listen: false).removeCharacter(value.characters[index]);
                        },
                        child: CharacterCard(
                          value.characters[index],
                        ),
                      );
                    });
              }),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => CreateScreen()),
                );
              },
              child: StyledHeading('Create new'),
            )
          ],
        ),
      ),
    );
  }
}
