// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignUpEntity {
  final String name;
  final String email;
  final String password;
  final String repeatedPassword;

  SignUpEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.repeatedPassword,
  });
}
