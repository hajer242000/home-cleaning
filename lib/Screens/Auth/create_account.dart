import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/text_form_field.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:homecleaning/controller_getx/app_controller.dart';
import 'package:homecleaning/controller_getx/data_state_controller.dart';
import 'package:homecleaning/core/api/dio_consumer.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  AppController appController = Get.put(
    AppController(api: DioConsumer(dio: Dio())),
  );
  bool obscureText = true;
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    easy.tr("create_account"),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Text(
                    textAlign: TextAlign.center,
                    easy.tr("fill_info_or_register"),
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Form(
                key: appController.globalKeyRegister,
                child: Column(
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
                      controller:
                          appController.textEditingControllerNameRegister,

                      hint: easy.tr('enter_full_name'),
                      required: true,
                      minLength: 3,
                      maxLength: 50,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      suffixIcon: const Icon(null),
                      validator: (value) {
                        if (value != null && value.contains(RegExp(r'[0-9]'))) {
                          return easy.tr('name_cannot_contain_numbers');
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    easy.tr('email'),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  AppTextFormField(
                    controller:
                        appController.textEditingControllerEmailRegister,

                    hint: 'example@gmail.com',
                    required: true,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    validator: (v) {
                      // extra rule (simple pattern)
                      if (v != null && !RegExp(r'.+@.+\..+').hasMatch(v)) {
                        return easy.tr('invalid_email');
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    easy.tr("password"),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  AppTextFormField(
                    controller:
                        appController.textEditingControllerPasswordRegister,

                    hint: '********',
                    required: true,
                    minLength: 6,
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => obscureText = !obscureText),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox,
                        onChanged: (value) {
                          setState(() {
                            checkbox = value!;
                          });
                        },

                        activeColor: checkbox ? primaryColor : secondaryColor,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: easy.tr('agree_with'),
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: easy.tr("terms_and_conditions"),
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Obx(() {
                var status = appController.dataState.value;
                if (status is SignupFailure) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Get.snackbar("Error", status.errorMessage);
                  });
                }
                if (status is SignupLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }
                return InkWell(
                  onTap: () {
                    if (appController.globalKeyRegister.currentState!.validate()) {
                      appController.register();
                    }
                  },
                  child: AppButton(title: easy.tr('sign_up')),
                );
              }),
              Row(
                children: [
                  Expanded(child: Divider()),
                  const SizedBox(width: 10),
                  Text(
                    easy.tr('or_sign_up_with'),
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Divider()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: secondaryColor),
                      ),

                      width: 60,
                      height: 60,
                      child: Image.asset('icons/apple.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: secondaryColor),
                      ),

                      width: 60,
                      height: 60,
                      child: Image.asset('icons/google.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: secondaryColor),
                      ),

                      width: 60,
                      height: 60,
                      child: Image.asset('icons/facebook.png'),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/signIn');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      easy.tr('already_have_account'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      easy.tr('sign_in'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
