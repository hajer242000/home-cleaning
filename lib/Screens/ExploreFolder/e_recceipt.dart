import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class ERecceipt extends StatefulWidget {
  const ERecceipt({super.key});

  @override
  State<ERecceipt> createState() => _ERecceiptState();
}

class _ERecceiptState extends State<ERecceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('eReceipt')),
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(    width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: '999999977777',
                    width: 300,
                    height: 100,
                    drawText: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        easy.tr('service') ,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        easy.tr('cleaningService'),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        easy.tr('serviceName'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                       easy.tr('deepHouseCleaning'),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        easy.tr('serviceProvider'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        easy.tr('jennyWilson'),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       easy.tr('bookingDate'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        easy.tr('sampleBookingDateTime'),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       easy.tr('amount'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '\$180.00',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       easy.tr('taxAndFees'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '\$30.00',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        easy.tr('name'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        easy.tr('estherHoward'),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        easy.tr('phoneNumber'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '+1 (208) 555-0112',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        easy.tr('transactionId'),
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '#RE2564HG23',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
           Positioned(
            bottom: 0,
            child: Container(
              height: Get.height / 7,
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
                child: InkWell(
                  onTap: () {
                   // Get.to(PaymentSuccess());
                  },
                  child: AppButton(title: easy.tr('downloadEReceipt')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
