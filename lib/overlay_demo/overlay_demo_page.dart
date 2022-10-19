import 'package:flame/game.dart';
import 'package:flame_exercise/overlay_demo/game_component/overlay_demo.dart';
import 'package:flutter/material.dart';

class OverlayDemoPage extends StatelessWidget {
  OverlayDemoPage({Key? key}) : super(key: key);

  final overlayGame = OverlayDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: overlayGame,
        overlayBuilderMap: {
          'PauseMenu': (context, game) {
            return Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.5),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Pause"),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        overlayGame.overlays.remove('PauseMenu');
                        overlayGame.resumeEngine();
                      },
                      child: const Text('Resume'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Exit'),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
