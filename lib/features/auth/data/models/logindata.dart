class LoginUserdata {
  final String accessToken;
  String? verifyAt;
  final String tokenType;
  final String status;

  LoginUserdata({
    required this.accessToken,
    this.verifyAt,
    required this.tokenType,
    required this.status,
  });

  factory LoginUserdata.fromJson(Map<String, dynamic> json) {
    return LoginUserdata(
      accessToken: json['accessToken'] ?? '',
      verifyAt: json['verify_at'],
      tokenType: json['token_type'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
