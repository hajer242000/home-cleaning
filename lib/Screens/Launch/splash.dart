import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ For navigation only
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
     Get.toNamed('/welcome');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.sizeOf(context).width),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: tertiaryColor,
            ),
            child: Image.asset("icons/appIcon.png"),
          ),
          SizedBox(height: 15),
          Text(
        easy.tr('home_cleaning'),
            style: TextStyle(
              color: tertiaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
