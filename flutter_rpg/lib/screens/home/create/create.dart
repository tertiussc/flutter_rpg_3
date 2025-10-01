import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/home/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

// Implement UUID
var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {
  // Manage the input data
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  // Dispose of controllers when not needed to free the memory
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // Submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // show error
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading('Must enter a character name'),
            content: StyledText('Every good RPG character needs a great name!'),
            actions: [
              StyledButton(
                  onPressed: () {
                    // pop the alert box from the stack
                    Navigator.pop(ctx);
                  },
                  child: StyledHeading('Close'))
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      // show error
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading('Must enter a slogan.'),
            content: StyledText('Remember to add a catchy slogan...'),
            actions: [
              StyledButton(
                  onPressed: () {
                    // pop the alert box from the stack
                    Navigator.pop(ctx);
                  },
                  child: StyledHeading('Close'))
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }

    // Provider to add new characters to CharacterStore
    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );

    // Navigate back to home screen
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
  }

  // Handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome message
              Center(
                  child: Icon(
                Icons.code,
                color: AppColors.primaryColor,
              )),
              Center(
                child: StyledHeading('Welcome new player.'),
              ),
              Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              SizedBox(
                height: 30,
              ),
              // Input form
              TextField(
                controller: _nameController,
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.titleMedium),
                decoration: InputDecoration(prefixIcon: Icon(Icons.person_2), label: StyledText('Character name')),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.titleMedium),
                decoration: InputDecoration(prefixIcon: Icon(Icons.chat), label: StyledText('Character slogan')),
              ),
              // Select vocation
              Center(
                  child: Icon(
                Icons.code,
                color: AppColors.primaryColor,
              )),
              Center(
                child: StyledHeading('Choose a Vocation.'),
              ),
              Center(
                child: StyledText('This determine you available skills.'),
              ),
              SizedBox(height: 30),

              // vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
              // good luck msg
              Center(
                  child: Icon(
                Icons.code,
                color: AppColors.primaryColor,
              )),
              Center(
                child: StyledHeading('Good luck.'),
              ),
              Center(
                child: StyledText('Enjoy the journey...'),
              ),
              SizedBox(height: 30),
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
