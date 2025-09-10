import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/home/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
      print('Name must not be empty');
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print('Slogan must not be empty');
      return;
    }
    print('Name: ${_nameController.text}');
    print('Slogan: ${_sloganController.text}');
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

              SizedBox(height: 30),
              Center(
                child: StyledButton(onPressed: handleSubmit, child: StyledHeading('Create Character')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
