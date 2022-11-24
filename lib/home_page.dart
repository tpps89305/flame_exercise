import 'package:flame_exercise/circles_example/circles_collision_page.dart';
import 'package:flame_exercise/overlay_demo/overlay_demo_page.dart';
import 'package:flame_exercise/router_demo/router_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}
