import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:da_fare/Views/Home/home_page.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'drawer_functions.dart';

class CustomDrawer extends HookWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );
    double maxSlide = 270.0;

    final drawerFuntions = DrawerFunctions(
        animationController: animationController,
        maxSlide: maxSlide,
        context: context);
    return Scaffold(
      body: GestureDetector(
        // onHorizontalDragStart: drawerFuntions.onDragStart,
        // onHorizontalDragEnd: drawerFuntions.onDragEnd,
        // onHorizontalDragUpdate: drawerFuntions.onDragUpdate,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.190);
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

class Menu {
  final String title;
  final IconData? icon;
  Menu({
    required this.title,
    this.icon,
  });
}

class BackDrawer extends StatelessWidget {
  final Function()? onTap;

  const BackDrawer({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Menu> menu = [
      Menu(
        title: 'Templetes',
        icon: CupertinoIcons.bookmark,
      ),
      Menu(
        title: 'Catergories',
        icon: IconlyLight.category,
      ),
      Menu(
        title: 'Analytics',
        icon: IconlyLight.chart,
      ),
      Menu(
        title: 'Settings',
        icon: IconlyLight.setting,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0d2260),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularPercentIndicator(
                  restartAnimation: true,
                  radius: 45.0,
                  lineWidth: 2.0,
                  animation: true,
                  percent: 0.7,
                  center: const CircleAvatar(
                    radius: 38,
                    backgroundColor: Color(0xFF0d2260),
                    backgroundImage: AssetImage(
                      'assets/github.png',
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                  backgroundColor: Colors.grey.shade500,
                ),
                const SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.blueGrey.shade100,
                        width: 0.7,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.chevron_left,
                        color: Colors.blueGrey.shade100,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              "Joy\nMitchell",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            for (var item in menu)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Row(
                  children: [
                    Icon(item.icon, color: Colors.white),
                    const SizedBox(width: 15),
                    Text(
                      item.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40,
            ),
            const SizedBox(height: 25),
            Text(
              "Good",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w200,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
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
