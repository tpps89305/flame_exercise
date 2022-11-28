import 'package:flame_exercise/tap_event_demo/game_component/tap_event_demo.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class TapEventPage extends StatelessWidget {
  const TapEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const GameWidget.controlled(gameFactory: TapEventDemo.new),
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
