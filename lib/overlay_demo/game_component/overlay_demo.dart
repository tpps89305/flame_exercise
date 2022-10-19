import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_exercise/overlay_demo/game_component/start_page.dart';

class OverlayDemo extends FlameGame with HasTappableComponents {
  @override
  Future<void>? onLoad() {
    add(StartPage());
    return null;
  }
}
