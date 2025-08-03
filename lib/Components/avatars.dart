import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:homecleaning/Screens/ExploreFolder/all_photo.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class MyAvatars extends StatelessWidget {
  final List<String> images;

  const MyAvatars({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    int maxVisible = 5;
    int overflow = images.length - maxVisible;

    List<Widget> avatarWidgets = [];

    for (int i = 0; i < images.length && i < maxVisible; i++) {
      avatarWidgets.add(
        Container(
          margin: EdgeInsets.only(right: 4),
          width: 50,
          height: 50,

          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[300],
            image: DecorationImage(
              image: AssetImage(images[i]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    if (overflow > 0) {
      avatarWidgets.add(
        InkWell(
          onTap: () {
            Get.to(AllPhoto(images: images,));
          },
          child: Container(
            margin: EdgeInsets.only(right: 4),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "+$overflow",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: tertiaryColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: avatarWidgets,
      ),
    );
  }
}
