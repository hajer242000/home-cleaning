
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ProfileFolder/booking_list_page.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Bookings'),
          leading: LeadingAppBar(
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Container(
                padding: EdgeInsets.all(5),

                decoration: BoxDecoration(
                  border: Border.all(color: quaternaryColor, width: 1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.search),
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: primaryColor,
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: primaryColor,
            tabs: [
       
              Tab(text: "Upcoming"),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
          
           SizedBox(height: Get.height, width: Get.width ,child: BookingListPage()),
                 SizedBox(height: Get.height, width: Get.width ,child: BookingListPage()),
                    SizedBox(height: Get.height, width: Get.width ,child: BookingListPage()),
          ],
        ),
      ),
    );
  }
}
