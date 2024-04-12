abstract class SignUpCredentialsEntity {
  final String name;
  final String email;
  final String password;
  final String repeatedPassword;

  SignUpCredentialsEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.repeatedPassword,
  });
}
