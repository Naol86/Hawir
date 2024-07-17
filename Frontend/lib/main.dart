import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/screens/hero_screen.dart';
import 'package:hawir/screens/home_screen.dart';
import 'package:hawir/screens/login_screen.dart';
import 'package:hawir/screens/tab_screen.dart';
import 'package:hawir/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure ServicesBinding initialization

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter<Group>(GroupAdapter());

  await Hive.openBox('myGroupsBox');

  var userStateBox = await Hive.openBox('user_state');

  late final Widget screen;
  if (userStateBox.get('firstTime', defaultValue: false)) {
    screen = HeroScreen();
    userStateBox.put('firstTime', false);
  } else {
    if (userStateBox.get('isLogin', defaultValue: false)) {
      screen = HomeScreen();
    } else {
      screen = LoginScreen();
    }
  }

  runApp(ProviderScope(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MaterialApp(
      title: 'Hawir',
      theme: AppTheme.lightTheme,
      home: TabsScreen(),
    ),
  )));
}
