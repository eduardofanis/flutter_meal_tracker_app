import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/models/user_model.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/user_entity.dart';

class FirebaseAuthDatasource implements AuthDatasource {
  @override
  Future<UserEntity> signIn(String email, String password) async {
    print(email);
    print(password);
    return UserModel(name: "", email: email, accessToken: "", refreshToken: "");
  }

  @override
  Future<UserEntity> signUp(String name, String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> validateSession(String accessToken, String refreshToken) {
    throw UnimplementedError();
  }
}
