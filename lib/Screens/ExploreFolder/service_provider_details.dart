import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ExploreFolder/about.dart';
import 'package:homecleaning/Screens/ExploreFolder/gallery.dart';
import 'package:homecleaning/Screens/ExploreFolder/profile_header.dart';
import 'package:homecleaning/Screens/ExploreFolder/review.dart';
import 'package:homecleaning/Screens/ExploreFolder/services.dart';
import 'package:homecleaning/Screens/ExploreFolder/stat_item.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class ServiceProviderDetails extends StatefulWidget {
  const ServiceProviderDetails({super.key});

  @override
  State<ServiceProviderDetails> createState() => _ServiceProviderDetailsState();
}

class _ServiceProviderDetailsState extends State<ServiceProviderDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(easy.tr("serviceProvider")),
          leading: LeadingAppBar(
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Container(
                padding: EdgeInsets.all(5),
      
                decoration: BoxDecoration(
                  border: Border.all(color: quaternaryColor, width: 1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.share),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Column(
                children: [
                  ProfileHeader(
                    userName: easy.tr(  "jennyWilson"),
                    service: easy.tr("cleaningServices"),
                    location: easy.tr(  "newYorkUSA"),
                  ),
                  Divider(height: 50),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        StatItem(
                          icon: Icons.groups_2_rounded,
                          value: '7,500+',
                          label: easy.tr( "customer"),
                        ),
                        StatItem(
                          icon: Icons.work_rounded,
                          value: '10+',
                          label: easy.tr("yearsExp"),
                        ),
                        StatItem(
                          icon: Icons.star_rate_rounded,
                          value: '4.9+',
                          label: easy.tr( "rating"),
                        ),
                        StatItem(
                          icon: Icons.chat_bubble_rounded,
                          value: '4,956',
                          label: easy.tr("review"),
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
                               Tab(text: easy.tr("services")),
                            Tab(text: easy.tr( "about")),
                            Tab(text: easy.tr( "gallery")),
                            Tab(text: easy.tr( "review")),
                          ],
                        ),
                      ),  SizedBox(
                      height: 800,
                      child: TabBarView(children: [Services() ,About(), Gallery(), Review()]),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
