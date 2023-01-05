import 'package:flame/game.dart';
import 'package:flame_exercise/parkour_example/game_component/demo_scenes.dart';

class ParkourGame extends FlameGame {
  late final DemoSceneOne _sceneOne = DemoSceneOne();

  @override
  Future<void>? onLoad() async {
    add(_sceneOne);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _sceneOne.position += Vector2(-dt * 200, 0);
    if (_sceneOne.position.x < -_sceneOne.size.x && _sceneOne.parent !=null) {
      remove(_sceneOne);
    }
  }
}
