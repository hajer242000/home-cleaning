import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final List<String> addressTypes = [
    easy.tr( "home"),
    easy.tr("parentsHouse"),
   easy.tr(  "farmHouse"),
  easy.tr( "other"),
  ];
  String selectedType = easy.tr(  "home");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(width: Get.width, height: Get.height),
          Container(
            width: Get.width,
            height: Get.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/map_about.png'),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: quaternaryColor, width: 1),
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: Get.height / 1.4,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      easy.tr( "saveAddressAs"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...addressTypes.map((toElement) {
                            final isSelected = selectedType == toElement;
                            return Row(
                              children: [
                                ChoiceChip(
                                  label: Text(toElement),
                                  selected: isSelected,
                                  onSelected: (_) {
                                    setState(() => selectedType = toElement);
                                  },
                                  selectedColor: primaryColor,
                                  labelStyle: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  backgroundColor: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  showCheckmark: false,
                                ),
                                SizedBox(width: 5),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                     Text(
                      easy.tr("completeAddress"),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.grey.shade100,
                      child:  TextField(
                        decoration: InputDecoration(
                          hintText: easy.tr( "enterAddress"),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ),

                    const SizedBox(height: 16),

                     Text(
                      easy.tr(  "floor"),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.grey.shade100,
                      child:  TextField(
                        decoration: InputDecoration(
                          hintText: easy.tr("enterFloor"),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                     Text(
                      easy.tr( "landmark"),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.grey.shade100,
                      child:  TextField(
                        decoration: InputDecoration(
                          hintText: easy.tr(  "enterLandmark_ar"),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {},
                      child: AppButton(title: easy.tr( "saveAddress")),
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
