import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_exercise/router_demo/game_home_page.dart';

class RouterDemo extends FlameGame with HasTappableComponents {
  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    add(
      router = RouterComponent(
        routes: {
          'home': Route(StartPage.new),
          // 'level-selector': Route(LevelSelectorPage.new),
          // 'settings': Route(SettingsPage.new, transparent: true),
          // 'pause': PauseRoute(),
          'confirm-dialog': OverlayRoute.existing(),
        },
        initialRoute: 'home',
      ),
    );
  }
}
