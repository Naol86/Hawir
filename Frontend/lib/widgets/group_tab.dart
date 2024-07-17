import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/providers/group_tab.dart';
import 'package:hawir/theme/colors.dart';

Widget groupTab(BuildContext context, WidgetRef ref) {
  final size = MediaQuery.of(context).size;
  final currentIndex = ref.watch(groupTabIndexProvider);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          ref.read(groupTabIndexProvider.notifier).setIndex(0);
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: currentIndex == 0
                  ? AppColors.primaryVariantColor
                  : Colors.transparent,
              width: 3.0,
            ),
          )),
          child: Text('Groups',
              style: TextStyle(
                  color: AppColors.primaryVariantColor,
                  fontFamily: 'poppins',
                  fontSize: 20)),
        ),
      ),
      GestureDetector(
        onTap: () {
          ref.read(groupTabIndexProvider.notifier).setIndex(1);
        },
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          margin: const EdgeInsets.only(
            right: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: currentIndex == 1
                    ? AppColors.primaryVariantColor
                    : Colors.transparent,
                width: 3.0,
              ),
            ),
          ),
          child: Text('My Groups',
              style: TextStyle(
                  color: AppColors.primaryVariantColor,
                  fontFamily: 'poppins',
                  fontSize: 20)),
        ),
      ),
      GestureDetector(
        onTap: () {
          ref.read(groupTabIndexProvider.notifier).setIndex(2);
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: currentIndex == 2
                    ? AppColors.primaryVariantColor
                    : Colors.transparent,
                width: 3.0,
              ),
            ),
          ),
          child: Text('Create',
              style: TextStyle(
                  color: AppColors.primaryVariantColor,
                  fontFamily: 'poppines',
                  fontSize: 20)),
        ),
      )
    ],
  );
}
