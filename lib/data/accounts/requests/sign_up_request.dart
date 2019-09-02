class SignUpRequest {
  final String fullName;
  final String email;
  final String username;
  final String password;
  final String language;
  final String timeZone;
  final String platform;

  SignUpRequest(this.fullName, this.username, this.email, this.password, this.language, this.timeZone, this.platform);

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
