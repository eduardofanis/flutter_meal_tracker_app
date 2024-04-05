import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    super.accessToken,
    super.refreshToken,
  });
}
