import 'package:dash/views/home.dart';
import 'package:dash/views/profile.dart';
import 'package:dash/views/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/activity.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int index = 0;

  final screens = [Home(), Activity(), Settings(), Profile()];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
          ),
          child: NavigationBar(
            height: 60,
            animationDuration: Duration(seconds: 2),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.bubble_chart_outlined),
                label: 'Activity',
                selectedIcon: Icon(Icons.bubble_chart),
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
                selectedIcon: Icon(Icons.settings),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined),
                label: 'Profile',
                selectedIcon: Icon(Icons.person),
              ),
              SizedBox(width: 50),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Get.toNamed('/new-dispatch'),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      );
}
