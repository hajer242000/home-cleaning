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

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AppController appController = Get.put(
    AppController(api: DioConsumer(dio: Dio())),
  );
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(25),
          child: Form(
            key: appController.formKeySignIn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      easy.tr("sign_in"),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      easy.tr("welcome_back_message"),
                      style: TextStyle(
                        fontSize: 12,
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
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
                      controller:
                          appController.textEditingControllerUsernameSignIn,
                      hint: 'Enter your username',
                      required: true,
                      keyboardType: TextInputType.text,
                      suffixIcon: const Icon(null),
                      validator: (v) {
                        if (v != null && v.trim().isEmpty) {
                          return easy.tr('username_required');
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
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    AppTextFormField(
                      controller:
                          appController.textEditingControllerPasswordSignIn,

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
                    InkWell(
                      onTap: () {
                        Get.toNamed('/verifyCode');
                      },
                      child: Align(
                        alignment: context.locale.languageCode == 'ar'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Text(
                          easy.tr('forgot_password'),
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  final status = appController.dataState.value;
                  if (status is SigninFailure) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.snackbar("Error", status.errorMessage);
                    });
                  }
                  if (status is SigninLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if (appController.formKeySignIn.currentState!
                          .validate()) {
                        appController.signIn();
                      }
                    },
                    child: AppButton(title: easy.tr('sign_in')),
                  );
                }),

                Row(
                  children: [
                    Expanded(child: Divider()),
                    const SizedBox(width: 10),
                    Text(
                      easy.tr('or_sign_in_with'),
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
                    Get.toNamed('/signUp');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        easy.tr('dont_have_account'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        easy.tr('sign_up'),
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
      ),
    );
  }
}
