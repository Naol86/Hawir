import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawir/gen/assets.gen.dart';
import 'package:hawir/screens/detail_screen.dart';
import 'package:hawir/theme/colors.dart';
import 'package:hawir/widgets/bottom_navbar.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var marker = [
      Marker(
        point: LatLng(12.03219, 39.04756),
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (ctx) => Container(
                      height: 200,
                      color: Colors.white,
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DetailsScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                        image: Image.asset(Assets.lib.assets
                                                .images.lalibela.path)
                                            .image,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Lalibela',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'poppins',
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      Text(
                                        'A historic town in Ethiopia renowned for its 12th-century rock-hewn churches carved into the mountains.',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'poppins',
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                    ));
          },
          icon: Icon(Icons.location_on),
          color: Colors.red,
        ),
      )
    ];
    return Scaffold(
        bottomNavigationBar: bottomNavbar(context, ref),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                  child: Container(
                child: Column(children: [
                  Flexible(
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(12.03219, 39.04756),
                        initialZoom: 9.2,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: marker,
                        ),
                        // RichAttributionWidget(
                        //   attributions: [
                        //     TextSourceAttribution(
                        //       'OpenStreetMap contributors',
                        //       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                ]),
              )),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: AnimSearchBar(
                  width: 300,
                  textController: TextEditingController(),
                  helpText: 'Search for places',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                  onSuffixTap: () {},
                  onSubmitted: (String) {},
                  rtl: true,
                  autoFocus: true,
                  closeSearchOnSuffixTap: true,
                ),
              ),
            ],
          ),
        ));
  }
}
