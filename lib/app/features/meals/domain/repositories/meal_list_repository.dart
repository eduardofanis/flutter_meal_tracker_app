import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

abstract class MealListRepository {
  Future<List<MealEntity>> getMealList();
  Future<List<MealEntity>> addMeal(List<FoodEntity> foods, TimeOfDay time);
  Future<List<MealEntity>> deleteMeal();
}
