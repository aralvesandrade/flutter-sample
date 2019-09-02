class AuthPermissionModel {
  final bool isAuthenticated;

  AuthPermissionModel(this.isAuthenticated);

  @override
  bool operator ==(Object other) {
    if (other != null && other is AuthPermissionModel) {
      return other.isAuthenticated == isAuthenticated;
    }
    return false;
  }
}
