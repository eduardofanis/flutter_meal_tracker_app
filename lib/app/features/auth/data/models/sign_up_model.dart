import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:string_validator/string_validator.dart' as validator;

class SignUpModel extends SignUpEntity {
  SignUpModel({
    required super.email,
    required super.password,
    required super.name,
    required super.repeatedPassword,
  });

  String? validateName() {
    if (name.isEmpty) {
      return "Name field is necessary.";
    }
    return null;
  }

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

  String? validateRepeatedPassword() {
    if (password != repeatedPassword) {
      return "The passwords don't match.";
    }
    if (password.length < 6) {
      return "The minimum password length is 6.";
    }
    if (password.isEmpty) {
      return "Password field is necessary.";
    }
    return null;
  }
}
