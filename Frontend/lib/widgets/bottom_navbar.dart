import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/providers/navbar_index.dart';
import 'package:hawir/theme/colors.dart';

Widget bottomNavbar(BuildContext context, WidgetRef ref) {
  int currentIndex = ref.watch(navbarIndexProvider);
  final size = MediaQuery.of(context).size;

  return Container(
      height: size.width * .155,
      decoration: const BoxDecoration(
        color: Color(0xEEEEEEEE),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  ref.read(navbarIndexProvider.notifier).setIndex(index);
                },
                splashColor: Colors.transparent, // Set a custom splash color
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == currentIndex ? 0 : size.width * .029,
                        right: size.width * .03,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == currentIndex ? size.width * .014 : 0,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryVariantColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: size.width *
                              0.076, // Maintain the same relative width
                          height: size.width *
                              0.076, // Assuming a square image, set height too
                          child: Image(
                            image: AssetImage(
                              listOfIcons[index],
                            ), // Replace with your image path
                            width: double
                                .infinity, // Stretch to fill the container's width
                            height: double
                                .infinity, // Stretch to fill the container's height
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.black38,
                            colorBlendMode: BlendMode
                                .modulate, // Apply color based on condition
                          ),
                        ),
                        Text(
                          listOfText[index],
                          style: TextStyle(
                            color: index == currentIndex
                                ? AppColors.primaryVariantColor
                                : Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
          }));
}

List<String> listOfIcons = [
  Assets.lib.assets.icons.home.path,
  Assets.lib.assets.icons.map.path,
  Assets.lib.assets.icons.group.path,
  Assets.lib.assets.icons.booking.path,
  Assets.lib.assets.icons.user.path,
];
List<String> listOfText = ["Home", "Map", "Group", "Booking", "User"];
