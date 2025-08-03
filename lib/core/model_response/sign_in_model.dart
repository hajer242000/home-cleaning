import 'package:homecleaning/core/constant/api_keys.dart';

class SignInModel {
  final bool status;
  final String? token;

  SignInModel({required this.status, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> dataJson) {
    return SignInModel(
      status: dataJson[ApiKeys.status],
      token: dataJson[ApiKeys.token??null],
    );
  }
}
