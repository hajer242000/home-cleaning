import 'package:flutter/material.dart';
import 'package:homecleaning/Screens/HomeFolder/popular_services_component.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: easy.tr( "services"),
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '(10)',
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              Text(
               easy.tr("viewAll"),
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return PopularServicesComponent();
              },
            ),
          ),
        ],
      ),
    );
  }
}
