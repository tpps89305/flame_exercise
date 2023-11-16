import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter/rendering.dart';
import 'dart:developer';

class GestureInputDemo extends FlameGame with DragCallbacks {
  late SpriteComponent player;

  @override
  Future<void>? onLoad() async {
    final playerImage = await loadSprite('player.png');
    player = SpriteComponent(
      sprite: playerImage,
      anchor: Anchor.center,
      size: Vector2(50, 50),
      position: Vector2(100, 100),
    );
    addAll([
      DragTarget(
        onDragDown: () {
          player.position.y += 50;
        },
        onDragUp: () {
          player.position.y -= 50;
        },
      ),
      player,
    ]);
  }
}

class DragTarget extends PositionComponent with DragCallbacks {
  DragTarget({
    required this.onDragDown,
    required this.onDragUp,
  }) : super(anchor: Anchor.center);

  final _rectPaint = Paint()..color = const Color.fromARGB(135, 219, 198, 224);

  Vector2? dragStartPosition;
  Vector2? dragEndPosition;
  Function() onDragDown;
  Function() onDragUp;

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    size = canvasSize - Vector2(0, 0);

    if (size.x < 100 || size.y < 100) {
      size = canvasSize * 0.9;
    }

    position = canvasSize / 2;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _rectPaint);
  }

  @override
  void onDragStart(DragStartEvent event) {
    // log("onDragStart = ${event.localPosition}");
    dragStartPosition = event.localPosition;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    // log("onDragUpdate = ${event.localPosition}");
    dragEndPosition = event.localPosition;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    if (dragStartPosition != null && dragStartPosition != null) {
      if (dragEndPosition!.y - dragStartPosition!.y >= 50) {
        log("人物往下移動");
        onDragDown();
      } else if (dragStartPosition!.y - dragEndPosition!.y >= 50) {
        log("人物往上移動");
        onDragUp();
      }
    }
    dragStartPosition = null;
    dragEndPosition = null;
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    dragStartPosition = null;
    dragEndPosition = null;
  }
}
