import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/user_entity.dart';

class FirebaseAuthDatasource implements AuthDatasource {
  @override
  Future<User> signIn(String email, String password) async {
    print(email);
    print(password);
    throw UnimplementedError();
  }

  @override
  Future<User> signUp(String name, String email, String password) async {
    throw UnimplementedError();
  }
}
