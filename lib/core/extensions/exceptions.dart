class CustomFirebaseException implements Exception {
  final String message;

  CustomFirebaseException(this.message);

  @override
  String toString() {
    return message;
  }
}
