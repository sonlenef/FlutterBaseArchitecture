class SharedPrefException implements Exception {
  final String message;
  final Object? error;

  const SharedPrefException(this.message, this.error);

  @override
  String toString() {
    return 'SharedPrefException: $message';
  }
}
