import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  // Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // Fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // Getters
  bool get isFav => _isFav;

  // Functions
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // Character to firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // Character from firstore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // get data from snapshot
    final data = snapshot.data()!;
    // make character instance
    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      id: snapshot.id,
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
    );
    // update skill based on firestore
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere(
        (element) => element.id == id,
      );
      character.updateSkill(skill);
    }
    // set isFav
    if (data['isFav'] == true) {
      character.toggleIsFav();
    }
    // Return the complete character
    return character;
  }
}

// Dummy Character data

List<Character> characters = [
  Character(name: 'Klara', slogan: 'Kapumf!', vocation: Vocation.wizard, id: '1'),
  Character(name: 'Jonny', slogan: 'Light me up...', vocation: Vocation.junkie, id: '2'),
  Character(name: 'Crimson', slogan: 'FIre in the hole!', vocation: Vocation.raider, id: '3'),
  Character(name: 'Shaun', slogan: 'Alright then gang.', vocation: Vocation.ninja, id: '4'),
];
