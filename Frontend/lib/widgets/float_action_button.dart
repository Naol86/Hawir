import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/screens/ai_chat_screen.dart';
import 'package:hawir/theme/colors.dart';

FloatingActionButton floatActionButton(BuildContext context, WidgetRef ref) {
  return FloatingActionButton(
    onPressed: () async {
      await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AIChatScreen(ref: ref)));
    },
    shape: const CircleBorder(),
    backgroundColor: AppColors.primaryColor,
    child: Image.asset(Assets.lib.assets.icons.ai2.path),
  );
}
