import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/providers/navbar_index.dart';
import 'package:hawir/screens/ai_chat_screen.dart';
import 'package:hawir/screens/booking_screen.dart';
import 'package:hawir/screens/home_screen.dart';
import 'package:hawir/screens/map_screen.dart';
import 'package:hawir/screens/user_screen.dart';
import 'package:hawir/screens/group_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarIndex = ref.watch(navbarIndexProvider);

    final screens = [
      HomeScreen(),
      MapScreen(),
      GroupScreen(),
      BookingScreen(),
      UserScreen()
    ];

    return screens[navbarIndex];
  }
}
