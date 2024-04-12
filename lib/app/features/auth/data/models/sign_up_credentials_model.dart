import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_credentials_entity.dart';

class SignUpCredentialsModel extends SignUpCredentialsEntity {
  SignUpCredentialsModel({
    required super.email,
    required super.password,
    required super.name,
    required super.repeatedPassword,
  });
}
