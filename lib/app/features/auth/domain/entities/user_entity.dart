abstract class UserEntity {
  final String name;
  final String email;
  final String? accessToken;
  final String? refreshToken;

  UserEntity({
    required this.name,
    required this.email,
    this.accessToken,
    this.refreshToken,
  });
}
