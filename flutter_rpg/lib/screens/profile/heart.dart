import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // Tween sequence (between) 25 --> 40
  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 25, end: 40),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 40, end: 25),
        weight: 50,
      ),
    ]).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: widget.character.isFav ? AppColors.primaryColor : Colors.grey[800],
              size: _sizeAnimation.value,
            ),
            onPressed: () async {
              await FirebaseFirestore.instance.collection('characters').doc(widget.character.id).update({'isFav': !widget.character.isFav});
              _controller.reset();
              _controller.forward();
              widget.character.toggleIsFav();
            },
          );
        });
  }
}
