class ErrorModel {
  final bool status;
  final String message;

  ErrorModel({required this.status, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'] == true || jsonData['status'] == 1,
      message: jsonData['message'] ?? 'An error occurred.',
    );
  }
}
