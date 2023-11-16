import 'package:flame/game.dart';
import 'package:flame_exercise/parkour_example/game_component/parkour_game.dart';
import 'package:flutter/material.dart';

class ParkourPage extends StatelessWidget {
  const ParkourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GameWidget.controlled(gameFactory: ParkourGame.new),
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
