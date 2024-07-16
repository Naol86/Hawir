import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/models/group.dart';
import 'package:hawir/providers/group_tab.dart';
import 'package:hawir/theme/colors.dart';
import 'package:hawir/widgets/bottom_navbar.dart';

class GroupScreen extends ConsumerWidget {
  const GroupScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final currentIndex = ref.watch(groupTabIndexProvider);
    print(currentIndex);
    return Scaffold(
      bottomNavigationBar: bottomNavbar(context, ref),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      padding: const EdgeInsets.only(bottom: 10),
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
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  // top: 10,
                  // bottom: 10,
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
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("start - end date"),
                        Spacer(),
                        Text("${group.memebers.length} memebers"),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        group.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryVariantColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            group.tags.map((str) => '#$str').join(' '),
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.primaryVariantColor,
                            ),
                          ),
                        ),
                        Spacer(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

final tabData = ["Group", "MyGroup", "Create"];

final group = Group(
  id: 1,
  title: "Meskel Festival",
  description: "description",
  startDate: DateTime.now(),
  endDate: DateTime(2024, 7, 20),
  memebers: [1],
  prices: 150,
  tags: ["culture", "religious"],
);

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