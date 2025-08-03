import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:homecleaning/Components/avatars.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/centered_play_material_controls.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ExploreFolder/about.dart';
import 'package:homecleaning/Screens/ExploreFolder/gallery.dart';
import 'package:homecleaning/Screens/ExploreFolder/review.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset('videos/grey.MP4');
    initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: true,
        showControls: true,
        allowFullScreen: true,
        aspectRatio: videoPlayerController.value.aspectRatio * 0.8,
        customControls: const CenteredPlayMaterialControls(),
      );

      setState(() {});
    });

    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(1.0);
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      FutureBuilder(
                        future: initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio:
                                  videoPlayerController.value.aspectRatio * 0.8,
                              child: Chewie(controller: chewieController),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.toNamed('/start');
                                },
                                icon: Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    color: tertiaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.arrow_back, size: 24),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: tertiaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.share, size: 24),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: tertiaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.favorite, size: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 110),
                          MyAvatars(
                            images: [
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                              'images/rectangle .png',
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: quaternaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                easy.tr("loremSnippet"),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(
                                  easy.tr("ratingWithReviews"),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          easy.tr("deepHouseCleaning"),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          easy.tr( "oceanAveAddress"),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: TabBar(
                      labelColor: primaryColor,
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      indicatorColor: primaryColor,
                      tabs: [
                        Tab(text: easy.tr( "about")),
                        Tab(text: easy.tr( "gallery")),
                        Tab(text: easy.tr(  "review")),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 800,
                    child: TabBarView(children: [About(), Gallery(), Review()]),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 110,
                width: Get.width,
                decoration: BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      easy.tr(  "totalPrice"),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: Text(
                      '\$180.00',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 200,
                      child: AppButton(title: easy.tr( "bookNow")),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
