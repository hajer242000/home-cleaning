import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Components/text_form_field.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingAppBar(onPressed: Get.back),
        title: Text('Your Profile'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Column(
      
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: Icon(Icons.edit, color: tertiaryColor),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      SizedBox(height: 10),
                      AppTextFormField(
                        controller: textEditingControllerName,

                        hint: 'Esther Howard',
                        required: true,
                        minLength: 3,
                        maxLength: 50,
                        keyboardType: TextInputType.name,
                        obscureText: false,

                        validator: (value) {
                          if (value != null &&
                              value.contains(RegExp(r'[0-9]'))) {
                            return 'Name cannot contain numbers';
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
                      Text('Phone Number'),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: textEditingControllerPhone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }

                          final cleaned = value.trim();

                          if (!RegExp(r'^[97][0-9]{7}$').hasMatch(cleaned)) {
                            return 'Enter a valid Omani phone number (starts with 9 or 7, 8 digits)';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Phone Number",
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
                  ),          SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
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
                            return 'Invalid email address';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),          SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        dropdownColor: Color(0xffF6F6F6),
                        decoration: InputDecoration(
                          hintText: "Select",
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
                        items: ['Male', 'Female']
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
                            value == null ? 'Please select a gender' : null,
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
                  onTap: () {},
                  child: AppButton(title: "Update "),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
