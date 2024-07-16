import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/widgets/bottom_navbar.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        bottomNavigationBar: bottomNavbar(context, ref),
        body: Center(
          child: Text(
            'Hello from user',
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
