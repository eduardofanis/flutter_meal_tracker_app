import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_credentials_entity.dart';

class SignInCredentialsModel extends SignInCredentialsEntity {
  SignInCredentialsModel({required super.email, required super.password});

  bool validate() {
    if (email.isEmpty) return false;
    if (password.isEmpty) return false;
    return true;
  }
}
