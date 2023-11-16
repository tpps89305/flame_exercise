import 'package:flame_exercise/circles_example/game_component/circles_collision_demo.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class CirclesCollisionPage extends StatelessWidget {
  const CirclesCollisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const GameWidget.controlled(gameFactory: CirclesCollisionDemo.new),
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
      ),
    );
  }
}
