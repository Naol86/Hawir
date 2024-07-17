// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/providers/group_notifier.dart';

class GroupDetailsScreen extends ConsumerWidget {
  const GroupDetailsScreen({Key? key, required this.group}) : super(key: key);
  final Group group;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = ref.watch(groupNotifierProvider);
    return Scaffold(
      appBar: AppBar(
          title:
              Text(group.title, style: Theme.of(context).textTheme.labelLarge)),
      body: SafeArea(
        child: Text('Group Details'),
      ),
    );
  }
}
