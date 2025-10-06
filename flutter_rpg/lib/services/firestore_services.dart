import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FireStoreService {
  static final ref = FirebaseFirestore.instance.collection('characters').withConverter(
        fromFirestore: Character.fromFirestore,
        toFirestore: (Character c, _) => c.toFirestore(),
      );

  // Create/Add new character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }
}

// Read/Get characters

// Update characters

// Delete characters
