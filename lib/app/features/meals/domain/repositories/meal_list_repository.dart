import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

abstract class MealListRepository {
  Future<List<MealEntity>> getMealList();
  Future<MealEntity> addMeal(List<FoodEntity> foods);
  Future<MealEntity> editMeal();
  Future<void> deleteMeal();
}
