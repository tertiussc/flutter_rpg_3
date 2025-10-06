import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/services/firestore_services.dart';

class CharacterStore extends ChangeNotifier {
  // Import some dummy data for now
  final List<Character> _characters = [
    Character(name: 'Klara', slogan: 'Kapumf!', vocation: Vocation.wizard, id: '1'),
    Character(name: 'Jonny', slogan: 'Light me up...', vocation: Vocation.junkie, id: '2'),
    Character(name: 'Crimson', slogan: 'FIre in the hole!', vocation: Vocation.raider, id: '3'),
    Character(name: 'Shaun', slogan: 'Alright then gang.', vocation: Vocation.ninja, id: '4'),
  ];

  // getter for the private data
  get characters => _characters;

  // Add character
  void addCharacter(Character character) {
    // Call firestore service to add character to firestore
    FireStoreService.addCharacter(character);
    // Update Character state in the application
    _characters.add(character);
    notifyListeners();
  }

  // Save (update) character

  // Remove character

  // Initially fetch character
}
