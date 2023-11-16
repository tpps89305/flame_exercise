import 'package:flame_exercise/circles_example/circles_collision_page.dart';
import 'package:flame_exercise/drag_event_demo/drag_event_page.dart';
import 'package:flame_exercise/gesture_input_demo/gesture_input_page.dart';
import 'package:flame_exercise/overlay_demo/overlay_demo_page.dart';
import 'package:flame_exercise/parkour_example/parkour_page.dart';
import 'package:flame_exercise/router_demo/router_page.dart';
import 'package:flame_exercise/tap_event_demo/tap_event_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flame"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Router"),
            subtitle: const Text("如何在引擎內導覽各場景"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RouterPage()));
            },
          ),
          ListTile(
            title: const Text("Pause"),
            subtitle: const Text("覆蓋遊戲畫面的選單"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OverlayDemoPage()));
            },
          ),
          ListTile(
            title: const Text("碰撞"),
            subtitle: const Text("碰撞偵測示範"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CirclesCollisionPage()));
            },
          ),
          ListTile(
            title: const Text("TapCallbacks"),
            subtitle: const Text("點擊事件示範"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TapEventPage()));
            },
          ),
          ListTile(
            title: const Text("DragCallbacks"),
            subtitle: const Text("拖曳事件示範"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DragEventPage()));
            },
          ),
          ListTile(
            title: const Text("GestureInput"),
            subtitle: const Text("手勢輸入示範"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GestureInputPage()));
            },
          ),
          ListTile(
            title: const Text("捲軸式跑酷場景"),
            subtitle: const Text("《人行道生存戰》場景"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ParkourPage()));
            },
          ),
        ],
      ),
    );
  }
}
