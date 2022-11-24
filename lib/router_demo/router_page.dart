import 'package:flame_exercise/router_demo/game_component/router_demo.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const GameWidget.controlled(gameFactory: RouterDemo.new),
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
