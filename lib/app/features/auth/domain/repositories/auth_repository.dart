import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> signIn(SignInCredentialsEntity credentials);
  Future<AuthState> signUp(SignUpCredentialsEntity credentials);
  Future<AuthState> validateSession(String accessToken, String refreshToken);
  Future<AuthState> signOut();
}
