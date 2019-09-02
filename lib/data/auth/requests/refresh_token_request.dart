class RefreshTokenRequest {
  final String token;

  RefreshTokenRequest(this.token);

  Map<String, dynamic> toJson() => {'token': token};
}
