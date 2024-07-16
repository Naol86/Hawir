import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/screens/detail_screen.dart';
import 'package:hawir/theme/colors.dart';
import 'package:hawir/widgets/bottom_navbar.dart';
import 'package:hawir/widgets/float_action_button.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      floatingActionButton: floatActionButton(context, ref),
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavbar(context, ref),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/id/237/200'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text('John Doe',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        DateFormat('MMMM dd, yyyy').format(now),
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: AppColors.secondaryColor),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(204, 84, 130, 179),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(0),
                        iconSize: 25,
                        icon: const Icon(
                          Icons.notifications,
                          color: AppColors.primaryColor,
                        )),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    height: 40,
                    child: TextField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        fillColor: Color.fromRGBO(
                          244,
                          244,
                          244,
                          1,
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        labelText: 'Search for places',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(204, 84, 130, 179),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(0),
                        iconSize: 25,
                        icon: ImageIcon(
                          Image.asset(Assets.lib.assets.icons.setting.path)
                              .image,
                          color: AppColors.primaryColor,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xf3f3f3),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          fixedSize: const Size(50, 70),
                        ),
                        onPressed: () {},
                        child: Column(
                          children: [
                            ImageIcon(
                              Assets.lib.assets.icons.hotelPng.image().image,
                              color: AppColors.primaryColor,
                              size: 40,
                            ),
                            Text(
                              'Hotels',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        getImage(600),
                        getImage(602),
                        getImage(603),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: index == 0
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Toursit Sites',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryVariantColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 160,
                              width: 120,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/id/600/2000/1200"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    colors: [
                                      Color.fromARGB(185, 3, 37, 88),
                                      Color.fromARGB(15, 3, 37, 88),
                                    ],
                                  ),
                                ),
                                child: const Text(
                                  'Place to visit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Widget getImage(int id) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      color: Colors.red,
      child: Image.network(
        "https://picsum.photos/id/$id/2000/1200",
        fit: BoxFit.fill,
      ),
    ),
  );
}
