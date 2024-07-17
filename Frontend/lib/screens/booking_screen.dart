import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/widgets/bottom_navbar.dart';

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        bottomNavigationBar: bottomNavbar(context, ref),
        body: Center(
          child: Text(
            ' booking screen',
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
