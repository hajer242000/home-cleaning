class SignUpModel {
  final bool status;
  final String message;

  SignUpModel({required this.status, required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> dataJson) {
    return SignUpModel(
      status: dataJson['status'],
      message: dataJson['message'],
    );
  }
}
