import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> signIn(SignInEntity signInCredentials);
  Future<AuthState> signUp(SignUpEntity signUpCredentials);
  Future<AuthState> signOut();
}
