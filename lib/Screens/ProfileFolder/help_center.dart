import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ProfileFolder/contact_us.dart';
import 'package:homecleaning/Screens/ProfileFolder/faq.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class HelpCenters extends StatefulWidget {
  const HelpCenters({super.key});

  @override
  State<HelpCenters> createState() => _HelpCentersState();
}

class _HelpCentersState extends State<HelpCenters> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(easy.tr('help_center')),
          leading: LeadingAppBar(
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(15),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    prefixIcon: Icon(Icons.search, color: primaryColor),
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: primaryColor, width: 1.5),
                    ),
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
                      Tab(text: "FAQ"),
                      Tab(text: "Contact Us"),
                    ],
                  ),
                ),
                Expanded(child: TabBarView(children: [FAQ(), ContactUs()])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
