import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel(
      {required super.carbohydrates,
      required super.proteins,
      required super.fats,
      required super.calories});
}
