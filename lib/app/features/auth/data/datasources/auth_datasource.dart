import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/user_entity.dart';

abstract class AuthDatasource {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String name, String email, String password);
}
