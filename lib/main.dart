import 'package:dash/views/client/new_dispatch.dart';
import 'package:dash/views/routes.dart';
import 'package:dash/views/settings.dart';
import 'package:dash/widgets/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'views/activity.dart';
import 'views/home.dart';
import 'views/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dash',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.grey[700],
        colorScheme: ColorScheme.fromSwatch(),

        // Define the default font family.
        // fontFamily: 'Poppins',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headline2: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            button: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Base(),
        '/home': (context) => const Home(),
        '/routes': (context) => const Routes(),
        '/new-dispatch': (context) => const NewDispatch(),
        '/profile': (context) => const Profile(),
        '/settings': (context) => const Settings(),
        '/dashboard': (context) => const Activity(),
      },
    );
  }
}
