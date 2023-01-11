import 'package:flame/game.dart';
import 'package:flame_exercise/parkour_example/game_component/demo_scenes.dart';

class ParkourGame extends FlameGame {
  late final DemoScene _sceneOne = DemoScene();
  late final DemoScene _sceneTwo = DemoScene();
  late final DemoScene _sceneThree = DemoScene();

  @override
  Future<void>? onLoad() async {
    addAll([_sceneOne, _sceneTwo, _sceneThree]);
    _sceneTwo.position = Vector2(500, 0);
    _sceneThree.position = Vector2(1000, 0);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _sceneOne.position += Vector2(-dt * 200, 0);
    _sceneTwo.position += Vector2(-dt * 200, 0);
    _sceneThree.position += Vector2(-dt * 200, 0);
    // 當場景移出螢幕時，重新設定場景，並排在最右邊，接在前一個場景。
    if (_sceneOne.position.x < -_sceneOne.size.x) {
      _sceneOne.setBackground();
      _sceneOne.position = Vector2(_sceneThree.x + _sceneThree.width, 0);
    } else if (_sceneTwo.position.x < -_sceneTwo.size.x) {
      _sceneTwo.setBackground();
      _sceneTwo.position = Vector2(_sceneOne.x + _sceneOne.width, 0);
    } else if (_sceneThree.position.x < -_sceneThree.size.x) {
      _sceneThree.setBackground();
      _sceneThree.position = Vector2(_sceneTwo.x + _sceneTwo.width, 0);
    }
  }
}
