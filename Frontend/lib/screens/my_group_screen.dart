import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/providers/group_tab.dart';
import 'package:hawir/providers/my_group.dart';
import 'package:hawir/theme/colors.dart';
import 'package:hawir/widgets/bottom_navbar.dart';
import 'package:hawir/widgets/float_action_button.dart';
import 'package:hawir/widgets/group_list_builder.dart';
import 'package:hawir/widgets/group_tab.dart';
import 'package:intl/intl.dart';

class MyGroupScreen extends ConsumerWidget {
  const MyGroupScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(groupTabIndexProvider);
    final myGroupData = ref.watch(myGroupProvider);
    print('HELLO');
    print(myGroupData);
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context, ref),
      floatingActionButton: floatActionButton(context, ref),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              groupTab(context, ref),
              buildGroupList(context, ref, myGroupData)
            ],
          ),
        ),
      ),
    );
  }
}
