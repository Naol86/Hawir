import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/theme/colors.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image:
                          Image.asset(Assets.lib.assets.images.lalibela2.path)
                              .image,
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 85,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                                      Assets.lib.assets.images.lalibela2.path)
                                  .image,
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 35,
                      width: 85,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(
                                    Assets.lib.assets.images.lalibela2.path)
                                .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 35,
                      width: 85,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(
                                    Assets.lib.assets.images.lalibela2.path)
                                .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Budget',
                          style: TextStyle(
                            fontFamily: 'poppines',
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$370',
                              style: TextStyle(
                                fontFamily: 'poppines',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    ElevatedButton.icon(
                      icon: ImageIcon(
                        Assets.lib.assets.icons.book.image().image,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      style: const ButtonStyle(
                        iconSize: WidgetStatePropertyAll(20),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.primaryColor),
                        // fixedSize: WidgetStatePropertyAll(Size(100, 50)),
                      ),
                      label: const Text('Plan',
                          style: TextStyle(
                              fontFamily: 'poppines',
                              fontSize: 18,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "The eleven Rock-hewn Churches of Lalibela are monolithic churches located in the western Ethiopian Highlands near the town of Lalibela, named after the late-12th and early-13th century King Gebre Meskel Lalibela of the Zagwe dynasty, who commissioned the massive building project of 11 rock-hewn churches to recreate the holy city of Jerusalem in his own kingdom.",
                  style: TextStyle(
                    fontFamily: 'poppines',
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
