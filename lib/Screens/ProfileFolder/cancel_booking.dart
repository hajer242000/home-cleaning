import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class CancelBooking extends StatefulWidget {
  const CancelBooking({super.key});

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  String? selectedReason = easy.tr('changeInPlans');
  final TextEditingController otherController = TextEditingController();

  final List<String> reasons = [
    easy.tr("cancelReason_changeInPlans"),
    easy.tr("cancelReason_foundAnotherProvider"),
    easy.tr("cancelReason_unexpectedWork"),
    easy.tr("cancelReason_changeInRequirements"),
    easy.tr("cancelReason_conflictInScheduling"),
    easy.tr("cancelReason_other"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('cancelBooking')),
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    easy.tr('selectCancelReason'),
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ...reasons.map((reason) {
                    return RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(reason),
                      activeColor: primaryColor,
                      value: reason,
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                    );
                  }),

                  if (selectedReason == 'Other') ...[
                    const Divider(height: 32),
                     Text(easy.tr('cancelReason_other'), style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: otherController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: easy.tr('enterYourReason'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
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
                  onTap: () {},
                  child: AppButton(title: easy.tr('cancelAppointment')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
