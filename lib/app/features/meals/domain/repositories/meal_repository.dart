import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

abstract class MealRepository {
  Future<MealEntity> editMeal();
  Future<MealEntity> deleteMeal();
  Future<MealEntity> addFood();
  Future<MealEntity> deleteFood();
}
