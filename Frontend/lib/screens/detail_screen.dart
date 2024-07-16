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
                        Image.asset(Assets.lib.assets.images.hotel1.path).image,
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
                                    Assets.lib.assets.images.hotel1.path)
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
                          image:
                              Image.asset(Assets.lib.assets.images.hotel1.path)
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
                          image:
                              Image.asset(Assets.lib.assets.images.hotel1.path)
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
                        'Price',
                        style: TextStyle(
                          fontFamily: 'poppines',
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$370/',
                            style: TextStyle(
                              fontFamily: 'poppines',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Night',
                            style: TextStyle(
                              fontFamily: 'poppines',
                              fontSize: 16,
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
                    label: const Text('Book',
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
              child: Expanded(
                  child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean malesuada, arcu nec posuere viverra, ante urna bibendum arcu, nec accumsan leo eros non erat. Sed a tempor mi, a laoreet velit. Nam laoreet tristique volutpat. Vivamus ultrices leo sit amet dolor pulvinar, vitae malesuada quam malesuada.',
                style: TextStyle(fontFamily: 'poppines', fontSize: 16),
              )),
            )
          ],
        ),
      )),
    );
  }
}
