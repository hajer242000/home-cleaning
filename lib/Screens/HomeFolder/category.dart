import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, dynamic>> services = [
    {"title": easy.tr("cleaning"), "icon": Icons.cleaning_services},
    {"title": easy.tr("repairing"), "icon": Icons.build},
    {"title": easy.tr("plumbing"), "icon": Icons.plumbing},
    {"title": easy.tr("shifting"), "icon": Icons.local_shipping},
    {"title": easy.tr("painting"), "icon": Icons.format_paint},
    {"title": easy.tr("laundry"), "icon": Icons.local_laundry_service},
    {"title": easy.tr("ac_repair"), "icon": Icons.ac_unit},
    {"title": easy.tr("car_repair"), "icon": Icons.car_repair},
    {"title": easy.tr("electrician"), "icon": Icons.engineering},
    {"title": easy.tr("carpenter"), "icon": Icons.handyman},
    {"title": easy.tr("iron"), "icon": Icons.iron},
    {"title": easy.tr("appliance"), "icon": Icons.kitchen},
    {"title": easy.tr("beauty"), "icon": Icons.content_cut},
    {"title": easy.tr("gardening"), "icon": Icons.grass},
    {"title": easy.tr("security"), "icon": Icons.security},
    {"title": easy.tr("massage"), "icon": Icons.self_improvement},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('category')),
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final service = services[index];
          return Column(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: quaternaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(service['icon'], color: primaryColor, size: 28),
              ),
              const SizedBox(height: 6),
              Text(
                service['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
