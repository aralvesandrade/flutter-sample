class SignUpRequest {
  static final String genderFemale = 'female';
  static final String genderMale = 'male';
  static final String genderUnknown = 'unknown';

  final String fullName;
  final String gender;
  final String email;
  final String password;
  final String language;
  final String timeZone;
  final String platform;

  SignUpRequest(this.fullName, this.gender, this.email, this.password, this.language, this.timeZone, this.platform);

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'gender': gender,
        'email': email,
        'password': password,
        'language_code': language,
        'timezone': timeZone,
        'platform': platform,
      };
}
