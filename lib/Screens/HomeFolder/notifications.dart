import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
 final todayNotifications = [
  {
    "icon": Icons.event_available,
    "title": easy.tr("serviceBookedTitle"),
    "message": easy.tr("serviceBookedMessage"),
    "time": "1h",
  },
  {
    "icon": Icons.local_offer,
    "title": easy.tr("homeCleaningOfferTitle"),
    "message":easy.tr( "homeCleaningOfferMessage"),
    "time": "1h",
  },
  {
    "icon": Icons.star_border,
    "title": easy.tr("reviewRequestTitle"),
    "message": easy.tr("reviewRequestMessage"),
    "time": "1h",
  },
];

final yesterdayNotifications = [
  {
    "icon": Icons.event_available,
    "title": easy.tr("serviceBookedTitle"),
    "message": easy.tr("serviceBookedMessage"),
    "time": "1d",
  },
  {
    "icon": Icons.account_balance_wallet_outlined,
    "title": easy.tr("newPaypalAddedTitle"),
    "message": easy.tr("newPaypalAddedMessage"),
    "time": "1d",
  },
  {
    "icon": Icons.event_available,
    "title": easy.tr("serviceBookedTitle"),
    "message": easy.tr("serviceBookedMessage"),
    "time": "1d",
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('notification')),
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Center(
              child: Text(
                easy.tr('twoNew'),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          sectionHeader(easy.tr('today')),
         ...todayNotifications.map((toElement)=>notificationCard(toElement)) ,
          const SizedBox(height: 20),
          sectionHeader(easy.tr('yesterday')),
          ...yesterdayNotifications.map((notif) => notificationCard(notif)),
        ],
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          easy.tr('markAllAsRead'),
          style: TextStyle(fontSize: 14, color: primaryColor),
        ),
      ],
    );
  }

  Widget notificationCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEAEAEA))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F7F6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(data['icon'], color: primaryColor),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      data['time'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  data['message'],
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
