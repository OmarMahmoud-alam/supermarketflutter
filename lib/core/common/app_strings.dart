class Apivar {
  static String? token;
  static String? get sendtoken => token != null ? 'Bearer $token' : null;
}
