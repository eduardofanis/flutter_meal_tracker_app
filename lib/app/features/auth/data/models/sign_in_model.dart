import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:string_validator/string_validator.dart' as validator;

class SignInModel extends SignInEntity {
  SignInModel({required super.email, required super.password});

  String? validateEmail() {
    if (!validator.isEmail(email)) {
      return "Needs to be a valid email.";
    }
    if (email.isEmpty) {
      return "Email field is necessary.";
    }
    return null;
  }

  String? validatePassword() {
    if (password.length < 6) {
      return "The minimum password length is 6.";
    }
    if (password.isEmpty) {
      return "Password field is necessary.";
    }
    return null;
  }
}
