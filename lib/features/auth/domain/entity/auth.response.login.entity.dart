class AuthResponseLoginEntity {
  AuthResponseLoginEntity({
    required this.error,
    this.status,
    this.token,
  });

  final String? status;
  final String? token;
  final bool error;
}
