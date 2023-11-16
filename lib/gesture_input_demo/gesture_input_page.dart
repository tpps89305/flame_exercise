import 'package:flame/game.dart';
import 'package:flame_exercise/gesture_input_demo/game_component/gesture_input_demo.dart';
import 'package:flutter/material.dart';

class GestureInputPage extends StatelessWidget {
  const GestureInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GameWidget.controlled(gameFactory: GestureInputDemo.new),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
