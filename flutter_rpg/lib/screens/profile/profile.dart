import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Basic info
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Hero(
                    tag: character.id.toString(),
                    child: Image.asset(
                      'assets/img/vocations/${character.vocation.image}',
                      width: 140,
                      height: 140,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [StyledHeading(character.vocation.title), StyledText(character.vocation.description)],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            // Weapon and ability
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Container(
                // This takes up all width
                width: double.infinity, color: AppColors.secondaryColor.withValues(alpha: 0.5),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading('Weapon of choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading('Unique Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            // Stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),

            // Save button
            StyledButton(
                onPressed: () {
                  // Save data to firestore
                  Provider.of<CharacterStore>(context, listen: false).saveCharacter(character);
                  // show snackbar for saved character
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Center(child: StyledHeading('Character Saved')),
                    showCloseIcon: true,
                    duration: Duration(seconds: 2),
                    backgroundColor: AppColors.secondaryColor,
                  ));
                },
                child: StyledHeading('Save Character')),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
