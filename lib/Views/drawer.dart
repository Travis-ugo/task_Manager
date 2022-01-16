import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:da_fare/Views/home_page.dart';

import 'drawer_functions.dart';

class CustomDrawer extends HookWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );
    double maxSlide = 225.0;

    final drawerFuntions = DrawerFunctions(
        animationController: animationController,
        maxSlide: maxSlide,
        context: context);
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: drawerFuntions.onDragStart,
        onHorizontalDragEnd: drawerFuntions.onDragEnd,
        onHorizontalDragUpdate: drawerFuntions.onDragUpdate,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Stack(
              children: [
                BackDrawer(
                  onTap: drawerFuntions.toggle,
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(
                        50 * animationController.value,
                      ),
                    ),
                    child: HomePage(
                      onTaped: drawerFuntions.toggle,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BackDrawer extends StatelessWidget {
  final Function()? onTap;
  const BackDrawer({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D38FF),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 50,
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border:
                        Border.all(color: Colors.blueGrey.shade100, width: 1.5),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      color: Colors.blueGrey.shade100,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              "Joy\nMitchell",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            for (var i = 0; i < 5; i++) fileRow(),
            const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 40,
            ),
            const Text(
              "Good",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              "Consistency",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fileRow() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: const [
          Icon(CupertinoIcons.bookmark, color: Colors.white),
          Text(
            "Templates",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
