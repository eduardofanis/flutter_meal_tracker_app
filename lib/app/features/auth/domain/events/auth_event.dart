import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_credentials_entity.dart';

abstract class AuthEvent {}

class SignInEvent implements AuthEvent {
  final SignInCredentialsEntity credentials;

  SignInEvent(this.credentials);
}

class SignUpEvent implements AuthEvent {
  final SignUpCredentialsEntity credentials;

  SignUpEvent(this.credentials);
}

class CheckAuthStateEvent implements AuthEvent {
  final String token;

  CheckAuthStateEvent(this.token);
}

class SignOutEvent implements AuthEvent {}
