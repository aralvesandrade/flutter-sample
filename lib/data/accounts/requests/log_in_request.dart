class LogInRequest {
  final String username;
  final String password;

  LogInRequest({this.username, this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
