// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../utils/user_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.blueGrey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('General',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22)),
            ),
            Divider(),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  const SettingsTile(
                    title: 'My Profile',
                    icon: Icons.person_outline,
                    route: '/profile',
                  ),
                  const SettingsTile(
                      title: 'Language',
                      icon: Icons.translate,
                      route: '/language'),
                  const SettingsTile(
                      title: 'Currency',
                      icon: Icons.attach_money,
                      route: '/currency'),
                  const SettingsTile(
                      title: 'Notifications',
                      icon: Icons.notifications_outlined,
                      route: '/notify'),
                  const SettingsTile(
                      title: 'My Activity',
                      icon: Icons.timeline_rounded,
                      route: '/activity'),
                  const SettingsTile(
                      title: 'Share Dash',
                      icon: Icons.ios_share,
                      route: '/share'),
                  const SettingsTile(
                      title: 'About',
                      icon: Icons.info_outline,
                      route: '/about'),
                  const SettingsTile(
                      title: 'Terms of service',
                      icon: Icons.policy_outlined,
                      route: '/terms'),
                  const SettingsTile(
                      title: 'Privacy Policy',
                      icon: Icons.lock_outline,
                      route: '/policies'),
                  const SettingsTile(
                      title: 'Help', icon: Icons.help_outline, route: '/help'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserTile(BuildContext context) {
    final user = UserPreferences.myUser;
    return ListTile(
      leading: ClipOval(
        child: Container(
          padding: EdgeInsets.all(4),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage((user.imagePath)))),
        ),
      ),
      title: Text(
        user.name,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
      ),
      subtitle: Text(
        'Welcome to the Teseract!',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/view-profile'),
          icon: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
          )),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key, required this.title, required this.icon, required this.route})
      : super(key: key);

  final String title;
  final IconData icon;
  final String route;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, route),
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.shade700,
        size: 12,
      ),
    );
  }
}
