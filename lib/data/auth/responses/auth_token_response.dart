class AuthTokenResponse {
  final String token;

  AuthTokenResponse(this.token);

  AuthTokenResponse.fromJson(Map<String, dynamic> json) : token = json['access_token'];
}
