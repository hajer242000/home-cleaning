import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class DataStateController {} //main class

final class DataStateControllerInitial extends DataStateController {} //Initial

//-----------------------Sign in State

//1-Loading

final class SigninLoading extends DataStateController {}

//2-Success

final class SigninSuccess extends DataStateController {
  final String page;

  SigninSuccess({required this.page});

  void navigateToPage() {
    Get.toNamed(page);
  }
}

//3-Failure
final class SigninFailure extends DataStateController {
  String errorMessage;
  SigninFailure({required this.errorMessage});
}

//-----------------------Sign up State

//1-Loading

final class SignupLoading extends DataStateController {}

//2-Success

final class SignupSuccess extends DataStateController {
  final String page;

  SignupSuccess({required this.page});

  void navigateToPage() {
    Get.toNamed(page);
  }
}

//3-Failure
final class SignupFailure extends DataStateController {
  String errorMessage;
  
  SignupFailure({required this.errorMessage});
}
