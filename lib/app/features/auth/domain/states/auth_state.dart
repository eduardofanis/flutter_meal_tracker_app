import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/errors/auth_errors.dart';

abstract class AuthState {}

class IdleState implements AuthState {
  const IdleState();
}

class SignedInState implements AuthState {
  final UserEntity user;
  const SignedInState(this.user);
}

class LoadingState implements AuthState {
  const LoadingState();
}

class SignedOutState implements AuthState {}

class ErrorState implements AuthState {
  final Failure error;
  const ErrorState(this.error);
}
