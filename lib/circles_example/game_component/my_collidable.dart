import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_exercise/circles_example/game_component/circles_collision_demo.dart';
import 'package:flutter/material.dart' hide Image, Draggable;

class MyCollidable extends PositionComponent
    with HasGameRef<CirclesCollisionDemo>, CollisionCallbacks {
  late Vector2 velocity;
  final _collisionColor = Colors.amber;
  final _defaultColor = Colors.cyan;
  late ShapeHitbox hitbox;

  MyCollidable(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(100),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;
    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
    final center = gameRef.size / 2;
    velocity = (center - position)..scaleTo(150);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(velocity * dt);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    hitbox.paint.color = _collisionColor;
    if (other is ScreenHitbox) {
      removeFromParent();
      return;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (!isColliding) {
      hitbox.paint.color = _defaultColor;
    }
  }
}
