import 'package:da_fare/utils/constant_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:da_fare/utils/constant_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Desktop extends StatelessWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CatalinaColor.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Menu(),
          CalenderArea(),
        ],
      ),
    );
  }
}

// this file is contains everything concerning
//the desktop model, therefore making it look very disorganized

class MenuItem {
  final String menuItemLabel;
  final IconData menuItemIcon;
  MenuItem({
    required this.menuItemLabel,
    required this.menuItemIcon,
  });
}

List<MenuItem> menuItem = [
  MenuItem(
    menuItemLabel: 'Dashboard',
    menuItemIcon: FontAwesomeIcons.chartPie,
  ),
  MenuItem(
    menuItemLabel: 'Calender',
    menuItemIcon: Icons.calendar_month,
  ),
  MenuItem(
    menuItemLabel: 'Activity',
    menuItemIcon: Icons.local_activity,
  ),
  MenuItem(
    menuItemLabel: 'Messages',
    menuItemIcon: Icons.message_sharp,
  ),
  MenuItem(
    menuItemLabel: 'Project Plan',
    menuItemIcon: Icons.place_rounded,
  ),
  MenuItem(
    menuItemLabel: 'Settings',
    menuItemIcon: CupertinoIcons.settings,
  ),
];

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 4.3,
      decoration: Unit.unitsBoxDecorator,
      child: Column(
        children: [
          menuItemData(
              menuItemIcon: FontAwesomeIcons.chair, menuItemLabel: 'Catalina'),
          for (var menu in menuItem)
            menuItemData(
              menuItemLabel: menu.menuItemLabel,
              menuItemIcon: menu.menuItemIcon,
            ),
          const Spacer(),
          menuItemData(
            menuItemLabel: 'Log Out',
            menuItemIcon: FontAwesomeIcons.signOutAlt,
          ),
        ],
      ),
    );
  }
}

Widget menuItemData(
    {required String menuItemLabel, required IconData menuItemIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
    child: Row(
      children: [
        Icon(menuItemIcon),
        const SizedBox(width: 20),
        Text(
          menuItemLabel,
        ),
      ],
    ),
  );
}

class RightList {
  final String title = 'title';
  final String subTitle = 'subTitle';
  final IconData iconData = FontAwesomeIcons.chartPie;
}

List<RightList> listTile = [
  RightList(),
  RightList(),
  RightList(),
  RightList(),
];

class CalenderArea extends StatelessWidget {
  const CalenderArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 4.3,
      decoration: BoxDecoration(
        color: CatalinaColor.backgroundColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 4.3,
            decoration: Unit.unitsBoxDecorator,
            child: Column(
              children: [
                for (var listItem in listTile)
                  ListTile(
                    title: Text(listItem.title),
                    subtitle: Text(listItem.subTitle),
                    leading: Icon(listItem.iconData),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width / 4.3,
            decoration: Unit.unitsBoxDecorator,
            child: const Text('Ads'),
          ),
        ],
      ),
    );
  }
}
