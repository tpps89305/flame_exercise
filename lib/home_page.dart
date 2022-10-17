import 'package:flame_exercise/router_demo/router_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flame"),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text("Router"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RouterPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
