import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/theme/colors.dart';
import 'package:intl/intl.dart';

Widget buildGroupList(
    BuildContext context, WidgetRef ref, List<Group> groupsData) {
  final size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Container(
      height: size.height * 0.7,
      child: ListView.builder(
        itemCount: groupsData.length,
        itemBuilder: (context, index) {
          final group = groupsData[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    5,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('dd MMM').format(group.startDate) +
                            " - " +
                            DateFormat('dd MMM').format(group.endDate) +
                            '/' +
                            DateFormat('yyyy').format(group.endDate),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryVariantColor,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${group.memebers.length} memebers",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryVariantColor,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      group.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryVariantColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          group.tags.map((str) => '#$str').join(' '),
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.primaryVariantColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          Assets.lib.assets.icons.forward.image().image,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
