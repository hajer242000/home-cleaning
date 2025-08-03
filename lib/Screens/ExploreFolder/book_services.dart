import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/horizontal_month_calendar.dart';
import 'package:homecleaning/Components/time_slot_selector.dart';
import 'package:homecleaning/Screens/ExploreFolder/confirm_address.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class BookServices extends StatefulWidget {
  const BookServices({super.key});

  @override
  State<BookServices> createState() => _BookServicesState();
}

class _BookServicesState extends State<BookServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.only(top: 25),

            decoration: BoxDecoration(color: secondaryColor),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: tertiaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_back, size: 24),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: tertiaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.share, size: 24),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: tertiaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.favorite, size: 24),
                            ),
                          ),
                        ],
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
              height: Get.height / 1.28,
              width: Get.width,
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: quaternaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            easy.tr('home_cleaning'),
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text(
                              easy.tr("ratingWithReviews"),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      easy.tr("deepHouseCleaning"),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      easy.tr("sampleAddress"),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),

                    SizedBox(height: 15),
                    Text(
                      easy.tr("bookAppointment"),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Text(
                      easy.tr("day"),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    HorizontalMonthCalendar(
                      initialDate: DateTime.now(),
                      onDateSelected: (picked) {
                        print('اخترت: $picked');
                      },
                    ),
                    SizedBox(height: 15),
                    Text(
                      easy.tr(  "time"),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    TimeSlotSelector(
                      startTime: const TimeOfDay(hour: 7, minute: 0),
                      endTime: const TimeOfDay(hour: 22, minute: 0),
                      interval: const Duration(minutes: 30),
                      onTimeSelected: (time) {
                        print("الوقت المختار: ${time.format(context)}");
                      },
                    ),
                    SizedBox(height: 15),
                    Text(
                      easy.tr("noteToServiceProvider"),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: easy.tr( "enterHere"),
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 16.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
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
                    Get.to(ConfirmAddress());
                  },
                  child: AppButton(title: easy.tr("continue")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
