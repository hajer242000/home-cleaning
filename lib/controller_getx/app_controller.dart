import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homecleaning/controller_getx/data_state_controller.dart';
import 'package:homecleaning/core/api/api_consumer.dart';
import 'package:homecleaning/core/constant/api_keys.dart';
import 'package:homecleaning/core/constant/end_points.dart';
import 'package:homecleaning/core/errors/error_register/error_sign_up.dart';
import 'package:homecleaning/core/errors/error_register/server_exception_register.dart';
import 'package:homecleaning/core/errors/error_sign_in/server_exception.dart';
import 'package:homecleaning/core/model_response/sign_in_model.dart';
import 'package:homecleaning/core/model_response/sign_up_model.dart';

class AppController extends GetxController {
  //Sign In Var
  GlobalKey<FormState> formKeySignIn = GlobalKey();
  TextEditingController textEditingControllerUsernameSignIn =
      TextEditingController();
  TextEditingController textEditingControllerPasswordSignIn =
      TextEditingController();

  //Data State Var

  var dataState = Rx<DataStateController>(DataStateControllerInitial());

  //api
  final ApiConsumer api;

  //constructor
  AppController({required this.api});

  //sign in response model
  SignInModel? signInModel;

  signIn() async {
    try {
      dataState.value = SigninLoading();
      final response = await api.post(
        EndPoints.login,
        data: {
          ApiKeys.username: textEditingControllerUsernameSignIn.text,
          ApiKeys.password: textEditingControllerPasswordSignIn.text,
        },
      );
      dataState.value = SigninSuccess(page: '/start');
      if (dataState.value is SigninSuccess) {
        (dataState.value as SigninSuccess).navigateToPage();
      }
      signInModel = SignInModel.fromJson(response);
      return response;
    } on ServerException catch (e) {
      dataState.value = SigninFailure(errorMessage: e.errModel.message);
    }
  }

  //--------------------------------Sign up
  GlobalKey<FormState> globalKeyRegister = GlobalKey();
  TextEditingController textEditingControllerNameRegister =
      TextEditingController();
  TextEditingController textEditingControllerEmailRegister =
      TextEditingController();
  TextEditingController textEditingControllerPasswordRegister =
      TextEditingController();

  register() async {
    try {
      dataState.value = SignupLoading();
      final response = await api.post(
        EndPoints.register,
        data: {
          ApiKeys.username: textEditingControllerNameRegister.text,
          ApiKeys.email: textEditingControllerEmailRegister.text,
          ApiKeys.password: textEditingControllerPasswordRegister.text,
          ApiKeys.role: "customer",
        },
      );
      dataState.value = SignupSuccess(page: '/start');
      if (dataState.value is SignupSuccess) {
        (dataState.value as SignupSuccess).navigateToPage();
      }
      final signUpModel = SignUpModel.fromJson(response);
      return signUpModel;
    } on ServerExceptionRegister catch (e) {
      dataState.value = SignupFailure(
        errorMessage: e.errModel.errors.toString(),
      );
    }
  }
}
