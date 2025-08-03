import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/HomeFolder/popular_services_component.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class PopularServices extends StatelessWidget {
  const PopularServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('popularServices')),
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
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return PopularServicesComponent();
            },
          ),
        ),
      ),
    );
  }
}
