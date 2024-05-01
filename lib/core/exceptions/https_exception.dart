class AppException implements Exception {
  final String message;
  final int statusCode;

  AppException({
    this.message = "An unexpected error occurred,",
    this.statusCode = 500,
  });

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message';
  }
}
