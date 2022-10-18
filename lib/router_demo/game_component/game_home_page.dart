import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_exercise/router_demo/game_component/router_demo.dart';
import 'package:flutter/rendering.dart';

class StartPage extends Component with HasGameRef<RouterDemo> {
  StartPage() {
    addAll([
      _logo = TextComponent(
        text: 'Router Demo',
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
        text: 'Level 1',
        action: () => gameRef.router.pushNamed('level1'),
        color: const Color(0xffadde6c),
        borderColor: const Color(0xffedffab),
      ),
      _button2 = RoundedButton(
        text: 'Level 2',
        action: () => gameRef.router.pushNamed('level2'),
        color: const Color(0xffdebe6c),
        borderColor: const Color(0xfffff4c7),
      ),
    ]);
  }

  late final TextComponent _logo;

  late final RoundedButton _button1;

  late final RoundedButton _button2;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    _logo.position = Vector2(size.x / 2, size.y / 3);

    _button1.position = Vector2(size.x / 2, _logo.y + 80);

    _button2.position = Vector2(size.x / 2, _logo.y + 140);
  }
}

class RoundedButton extends PositionComponent with TapCallbacks {
  RoundedButton({
    required this.text,
    required this.action,
    required Color color,
    required Color borderColor,
    anchor = Anchor.center,
  }) : _textDrawable = TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w800,
          ),
        ).toTextPainter(text) {
    size = Vector2(150, 40);

    _textOffset = Offset(
      (size.x - _textDrawable.width) / 2,
      (size.y - _textDrawable.height) / 2,
    );

    _rrect = RRect.fromLTRBR(0, 0, size.x, size.y, Radius.circular(size.y / 2));

    _bgPaint = Paint()..color = color;

    _borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = borderColor;
  }

  final String text;

  final void Function() action;

  final TextPainter _textDrawable;

  late final Offset _textOffset;

  late final RRect _rrect;

  late final Paint _borderPaint;

  late final Paint _bgPaint;

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(_rrect, _bgPaint);

    canvas.drawRRect(_rrect, _borderPaint);

    _textDrawable.paint(canvas, _textOffset);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(1.05);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);

    action();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
  }
}
