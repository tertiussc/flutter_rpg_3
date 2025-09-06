import 'package:flutter_rpg/models/stats.dart';

class Character with Stats {
  // Constructor
  Character({required this.name, required this.slogan, required this.id});

  // Fields
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // Getters
  bool get isFav => _isFav;

  // Functions
  void toggleIsFac() {
    _isFav = !_isFav;
  }
}
