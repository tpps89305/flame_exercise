import 'package:flame/game.dart';
import 'package:flame_exercise/drag_event_demo/game_component/drag_event_demo.dart';
import 'package:flutter/material.dart';

class DragEventPage extends StatelessWidget {
  const DragEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, // 如果頂端有間隔的話，繪畫軌跡會跑到觸控點下面（與觸控點相同位置才合理）。
      child: Scaffold(
        body: Stack(
          children: [
            const GameWidget.controlled(gameFactory: DragEventDemo.new),
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
