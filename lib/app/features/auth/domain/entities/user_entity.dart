abstract class User {
  final String name;
  final String email;
  final String? accessToken;
  final String? refreshToken;

  User({
    required this.name,
    required this.email,
    this.accessToken,
    this.refreshToken,
  });
}
