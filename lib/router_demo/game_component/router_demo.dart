import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_exercise/router_demo/game_component/game_home_page.dart';
import 'package:flame_exercise/router_demo/game_component/level_page.dart';

class RouterDemo extends FlameGame with HasTappableComponents {
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    add(
      router = RouterComponent(
        routes: {
          'home': Route(StartPage.new),
          'level1': Route(Level1Page.new),
          'level2': Route(Level2Page.new),
          'pause': PauseRoute(),
          'confirm-dialog': OverlayRoute.existing(),
        },
        initialRoute: 'home',
      ),
    );
  }
}
