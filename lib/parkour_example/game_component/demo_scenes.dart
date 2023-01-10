import 'dart:developer';
import 'dart:math' hide log;

import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter/material.dart';

class DemoScene extends PositionComponent {
  late Paint _rectPaint;
  final Random random = Random();

  @override
  Future<void>? onLoad() async {
    log("Scene one on load", name: "DemoSceneOne");
    setBackground();
  }

  @override
  void onMount() {
    // 清場，重新佈置場景。
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    size = Vector2(500, canvasSize.y);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _rectPaint);
  }

  @override
  void onRemove() {
    log("Scene one on remove", name: "DemoSceneOne");
  }

  /// 重新設定背景顏色，這裡模擬重新布置場景的情形。
  setBackground() {
    int valueR = random.nextInt(256);
    int valueG = random.nextInt(256);
    int valueB = random.nextInt(256);

    _rectPaint = Paint()..color = Color.fromARGB(255, valueR, valueG, valueB);
  }
}
