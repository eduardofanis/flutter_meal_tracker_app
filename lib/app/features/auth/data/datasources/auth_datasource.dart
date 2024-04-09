import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/user_entity.dart';

abstract class AuthDatasource {
  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(String name, String email, String password);
  Future<UserEntity> checkAuthState(String token);
}
