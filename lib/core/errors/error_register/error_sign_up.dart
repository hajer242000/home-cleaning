
class ErrorModelRegister {
  final String type;
  final String title;
  final int status;
  final Map<String, List<String>> errors;

  ErrorModelRegister({
    required this.type,
    required this.title,
    required this.status,
    required this.errors,
  });

  factory ErrorModelRegister.fromJson(Map<String, dynamic> dataJson) {
     final rawErrors = dataJson['errors'] as Map<String, dynamic>;
    final parsedErrors = rawErrors.map(
      (key, value) => MapEntry(key, List<String>.from(value)),
    );
    return ErrorModelRegister(
      type: dataJson['type'],
      title: dataJson['title'],
      status: dataJson['status'],
      errors: parsedErrors,
    );
  }
}