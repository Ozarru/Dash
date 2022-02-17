// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Image.asset('assets/branding/logo-b.png',
                width: 50, height: 50),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                DrawerTile(
                  label: 'Home',
                  icon: Icons.home,
                  route: '/',
                ),
                DrawerTile(
                  label: 'New dispatch',
                  icon: TablerIcons.truck_delivery,
                  route: '/new-dispatch',
                ),
                DrawerTile(
                  label: 'Available riders',
                  icon: TablerIcons.bike,
                  route: '/dispatches',
                ),
                DrawerTile(
                  label: 'Coupons',
                  icon: TablerIcons.ticket,
                  route: '/categories',
                ),
                DrawerTile(
                  label: 'History',
                  icon: Icons.history,
                  route: '/history',
                ),
                DrawerTile(
                  label: 'My Activity',
                  icon: TablerIcons.activity,
                  route: '/activity',
                ),
                DrawerTile(
                  label: 'Settings',
                  icon: Icons.settings,
                  route: '/settings',
                ),
                DrawerTile(
                  label: 'Terms of use',
                  icon: Icons.new_releases,
                  route: '/terms',
                ),
                DrawerTile(
                  label: 'Privacy policy',
                  icon: Icons.privacy_tip,
                  route: '/policy',
                ),
                TextButton.icon(
                  onPressed: () => debugPrint('Login out now.'),
                  icon: Icon(Icons.logout),
                  label: Text('Logout'),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {required this.label, required this.icon, required this.route});
  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black45),
      title: Text(
        label,
        style: TextStyle(fontSize: 15),
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
    );
  }
}
