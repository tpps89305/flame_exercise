import 'package:flame/components.dart';
import 'package:flame_exercise/overlay_demo/game_component/overlay_demo.dart';
import 'package:flame_exercise/router_demo/game_component/game_home_page.dart';
import 'package:flutter/material.dart';

class StartPage extends Component with HasGameRef<OverlayDemo> {
  StartPage() {
    addAll([
      _logo = TextComponent(
        text: 'Overlay Demo',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 32,
            color: Color(0xFFC8FFF5),
            fontWeight: FontWeight.w800,
          ),
        ),
        anchor: Anchor.center,
      ),
      _button1 = RoundedButton(
        text: 'Pause',
        action: () {
          if (gameRef.overlays.isActive('PauseMenu')) {
            gameRef.overlays.remove('PauseDemo');
            gameRef.resumeEngine();
          } else {
            gameRef.overlays.add('PauseMenu');
            gameRef.pauseEngine();
          }
        },
        color: const Color(0xffadde6c),
        borderColor: const Color(0xffedffab),
      )
    ]);
  }

  late final TextComponent _logo;

  late final RoundedButton _button1;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    _logo.position = Vector2(size.x / 2, size.y / 2);

    _button1.position = Vector2(size.x / 2, _logo.y + 80);
  }
}
