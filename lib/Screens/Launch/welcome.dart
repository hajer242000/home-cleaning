import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/clip_path.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height:
                        MediaQuery.sizeOf(context).height -
                        MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: "${easy.tr('lets_find_the')}\t",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: easy.tr('professional_cleaning_repair'),
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: "\t${easy.tr('service')}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    textAlign: TextAlign.center,
                 easy.tr('lorem_description'),
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/onboarding');
                      },
                      child: AppButton(title: easy.tr('lets_get_started')),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.toNamed('/signIn');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                         easy.tr('already_have_account'),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                        "\t${ easy.tr( 'sign_in')}",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff01AC66),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff01AC66),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),

                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/default.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
