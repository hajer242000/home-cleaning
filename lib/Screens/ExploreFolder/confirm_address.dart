import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ExploreFolder/customer_info.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class ConfirmAddress extends StatefulWidget {
  const ConfirmAddress({super.key});

  @override
  State<ConfirmAddress> createState() => _ConfirmAddressState();
}

class _ConfirmAddressState extends State<ConfirmAddress> {
  int selectedIndex = 0;

  final List<Map<String, String>> addresses = [
    {'title': easy.tr('home'), 'subtitle': easy.tr('homeAddress')},
    {'title': easy.tr('parentsHouse'), 'subtitle': easy.tr('parentsAddress')},
    {'title': easy.tr('farmHouse'), 'subtitle': easy.tr('farmAddress')},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr('confirmAddress')),
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
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: addresses.length + 1,
              separatorBuilder: (_, __) => const Divider(height: 32),
              itemBuilder: (context, index) {
                if (index < addresses.length) {
                  final address = addresses[index];
                  final isSelected = selectedIndex == index;

                  return ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFF4F8C78),
                    ),
                    title: Text(
                      address['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(address['subtitle']!),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: selectedIndex,
                      onChanged: (val) {
                        setState(() => selectedIndex = val!);
                      },
                      activeColor: const Color(0xFF4F8C78),
                    ),
                    onTap: () => setState(() => selectedIndex = index),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      print("Add New Delivery Address");
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: Color(0xFF4F8C78)),
                            SizedBox(width: 8),
                            Text(
                              easy.tr('addNewDeliveryAddress'),
                              style: TextStyle(
                                color: Color(0xFF4F8C78),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
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
                    Get.to(CustomerInfo());
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
}
