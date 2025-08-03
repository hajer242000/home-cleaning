import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ExploreFolder/e_recceipt.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4F8C78),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 32),

                   Text(
                    easy.tr("congratulations"),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                     easy.tr('bookingConfirmation'),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height / 5,
              width: Get.width,
              decoration: BoxDecoration(
                color: tertiaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ERecceipt());
                      },
                      child: AppButton(title: easy.tr('viewEReceipt')),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(PaymentSuccess());
                      },
                      child: Text(
                        easy.tr('viewMyBookings'),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
