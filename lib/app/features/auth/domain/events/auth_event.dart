import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthEvent {}

class SignInEvent implements AuthEvent {
  final SignInEntity signInCredentials;

  SignInEvent(this.signInCredentials);
}

class SignUpEvent implements AuthEvent {
  final SignUpEntity signUpCredentials;

  SignUpEvent(this.signUpCredentials);
}

class SignOutEvent implements AuthEvent {}
