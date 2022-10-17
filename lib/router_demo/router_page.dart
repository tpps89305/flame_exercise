import 'package:flame_exercise/router_demo/game_home_page.dart';
import 'package:flame_exercise/router_demo/router_demo.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class RouterPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return GameWidget.controlled(gameFactory: RouterDemo.new);
  }
}

