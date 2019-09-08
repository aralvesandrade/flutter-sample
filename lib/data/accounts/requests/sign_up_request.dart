class SignUpRequest {
  final String email;
  final String fullName;
  final String username;
  final String password;
  final String language;
  final String timeZone;
  final String platform;

  SignUpRequest({
    this.email,
    this.fullName,
    this.username,
    this.password,
    this.language,
    this.timeZone,
    this.platform,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'full_name': fullName,
        'username': username,
        'password': password,
        'language': language,
        'time_zone': timeZone,
        'platform': platform,
      };
}
