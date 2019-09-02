class LogInRequest {
  final String email;
  final String password;

  LogInRequest(this.email, this.password);

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
