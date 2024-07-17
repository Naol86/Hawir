import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/providers/group_tab.dart';
import 'package:hawir/providers/navbar_index.dart';
import 'package:hawir/screens/ai_chat_screen.dart';
import 'package:hawir/screens/booking_screen.dart';
import 'package:hawir/screens/create_group_screen.dart';
import 'package:hawir/screens/home_screen.dart';
import 'package:hawir/screens/map_screen.dart';
import 'package:hawir/screens/my_group_screen.dart';
import 'package:hawir/screens/user_screen.dart';
import 'package:hawir/screens/group_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarIndex = ref.watch(navbarIndexProvider);
    final groupTabIndex = ref.watch(groupTabIndexProvider);

    if (navbarIndex == 1) {
      return const MapScreen();
    }
    if (navbarIndex == 2) {
      if (groupTabIndex == 0) {
        return const GroupScreen();
      }
      if (groupTabIndex == 1) {
        return const MyGroupScreen();
      }
      return CreateGroupScreen(
        ref: ref,
      );
    }
    if (navbarIndex == 3) {
      return const BookingScreen();
    }
    if (navbarIndex == 4) {
      return const UserScreen();
    }
    return const HomeScreen();
  }
}
