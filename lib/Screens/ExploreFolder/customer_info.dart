import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Components/text_form_field.dart';
import 'package:homecleaning/Screens/ExploreFolder/payment_method.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({super.key});

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  String? _selectedGender = easy.tr("male");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(easy.tr("bookServices")),
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
                  Text(
                    easy.tr("customerInformation"),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        easy.tr("name"),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),

                      AppTextFormField(
                        controller: textEditingControllerName,

                        hint: easy.tr("estherHoward"),
                        required: true,
                        minLength: 3,
                        maxLength: 50,
                        keyboardType: TextInputType.name,
                        obscureText: false,

                        validator: (value) {
                          if (value != null &&
                              value.contains(RegExp(r'[0-9]'))) {
                            return easy.tr("nameNoNumbers");
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        easy.tr("email"),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      AppTextFormField(
                        controller: textEditingControllerEmail,

                        hint: 'example@gmail.com',
                        required: true,
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: const Icon(null),
                        validator: (v) {
                          // extra rule (simple pattern)
                          if (v != null && !RegExp(r'.+@.+\..+').hasMatch(v)) {
                            return easy.tr("invalidEmail");
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        easy.tr("gender"),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        dropdownColor: Color(0xffF6F6F6),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: _selectedGender,

                        items: [easy.tr('male'), easy.tr('female')]
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'easy.tr(  "selectGender")' : null,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        easy.tr("phoneNumber"),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: textEditingControllerPhone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return easy.tr("enterPhoneNumber");
                          }

                          final cleaned = value.trim();

                          if (!RegExp(r'^[97][0-9]{7}$').hasMatch(cleaned)) {
                            return easy.tr("validOmaniPhone");
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: easy.tr(  "enterPhone"),
                          prefix: const Text("+968 | "),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       easy.tr( "county"),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),

                      TextFormField(
                        readOnly: true,
                        autovalidateMode: AutovalidateMode.disabled, // manual
                        decoration: InputDecoration(
                          hintText: easy.tr( "oman"),

                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                    Get.to(PaymentMethod());
                  },
                  child: AppButton(title:easy.tr( "continue") )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
