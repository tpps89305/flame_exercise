import 'dart:developer';

import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter/material.dart';

class DemoSceneOne extends PositionComponent {
  final _rectPaint = Paint()..color = const Color.fromARGB(135, 219, 198, 224);
  @override
  Future<void>? onLoad() async {
    log("Scene one on load", name: "DemoSceneOne");
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    size = canvasSize;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _rectPaint);
  }

  @override
  void onRemove() {
    log("Scene one on remove", name: "DemoSceneOne");
  }
}
