import 'package:flame_exercise/router_demo/game_component/router_demo.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(Object context) {
    return const SafeArea(
      child: GameWidget.controlled(gameFactory: RouterDemo.new),
    );
  }
}
