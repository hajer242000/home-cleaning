import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ExploreFolder/payment_success.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class ReviewSummary extends StatefulWidget {
  const ReviewSummary({super.key});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('reviewSummary')),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDFF4EE),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child:  Text(
                                    easy.tr('home_cleaning'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4F8C78),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  "4.8",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                             Text(
                             easy.tr('deepHouseCleaning'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children:  [
                                Icon(
                                  Icons.person,
                                  size: 14,
                                  color: Colors.teal,
                                ),
                                SizedBox(width: 4),
                                Text(easy.tr('jenny_wilson')),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "\$180.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  Divider(),
                  const SizedBox(height: 24),
                  buildRow(easy.tr('bookingDate'), easy.tr('sampleBookingDateTime')),
                  const SizedBox(height: 12),
                  buildRow(easy.tr('customer'), easy.tr('estherHoward')),
                  const SizedBox(height: 12),

                  const Divider(height: 32),

     
                  buildRow(easy.tr('amount'), "\$180.00"),
                  const SizedBox(height: 8),
                  buildRow(easy.tr('taxAndFees'), "\$30.00"),
                  const SizedBox(height: 8),
                  buildRow(easy.tr('total'), "\$210.00", bold: true),

                  const Divider(height: 24),

                  Row(
                    children: [
                      const Icon(Icons.money, color: Colors.teal),
                      const SizedBox(width: 8),
                       Text(easy.tr('cash'), style: TextStyle(fontSize: 16)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
           
                        },
                        child:  Text(
                          easy.tr('change'),
                          style: TextStyle(color: Colors.teal),
                        ),
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
                    Get.to(PaymentSuccess());
                  },
                  child: AppButton(title: easy.tr('continue')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
