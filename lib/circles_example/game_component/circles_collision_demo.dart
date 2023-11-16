import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_exercise/circles_example/game_component/my_collidable.dart';

class CirclesCollisionDemo extends FlameGame
    with HasCollisionDetection, TapDetector {
  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());
  }

  @override
  void onTapDown(TapDownInfo info) {
    add(MyCollidable(info.eventPosition.global));
  }
}
