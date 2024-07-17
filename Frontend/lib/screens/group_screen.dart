import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/providers/group_tab.dart';
import 'package:hawir/widgets/bottom_navbar.dart';
import 'package:hawir/widgets/float_action_button.dart';
import 'package:hawir/widgets/group_list_builder.dart';
import 'package:hawir/widgets/group_tab.dart';

class GroupScreen extends ConsumerWidget {
  const GroupScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(groupTabIndexProvider);
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context, ref),
      floatingActionButton: floatActionButton(context, ref),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              groupTab(context, ref),
              buildGroupList(context, ref, groupsData)
            ],
          ),
        ),
      ),
    );
  }
}

final tabData = ["Group", "MyGroup", "Create"];

final groupsData = [
  Group(
    id: 1,
    title: "Meskel Festival",
    description: "description",
    startDate: DateTime.now(),
    endDate: DateTime(2024, 7, 20),
    memebers: [1],
    prices: 150,
    tags: ["culture", "religious"],
  )
];





// ListView.builder(
//               itemCount: 3,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     // ref.read(navbarIndexProvider.notifier).setIndex(index);
//                   },
//                   splashColor: Colors.transparent, // Set a custom splash color
//                   highlightColor: Colors.transparent,
//                   child: Container(
//                     height: 100,
//                     width: 100,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           listOfText[index],
//                           style: TextStyle(
//                             color: index == currentIndex
//                                 ? AppColors.primaryVariantColor
//                                 : Colors.black38,
//                           ),
//                         ),
//                         AnimatedContainer(
//                           duration: const Duration(milliseconds: 1500),
//                           curve: Curves.fastLinearToSlowEaseIn,
//                           margin: EdgeInsets.only(
//                             bottom:
//                                 index == currentIndex ? 0 : size.width * .029,
//                             right: size.width * .03,
//                             left: size.width * .0422,
//                           ),
//                           width: size.width * .128,
//                           height: index == currentIndex ? size.width * .014 : 0,
//                           decoration: const BoxDecoration(
//                             color: AppColors.primaryVariantColor,
//                             borderRadius: BorderRadius.vertical(
//                               bottom: Radius.circular(10),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )