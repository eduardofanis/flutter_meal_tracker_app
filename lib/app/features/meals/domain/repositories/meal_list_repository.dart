import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/states/meal_list_state.dart';

abstract class MealListRepository {
  Future<MealListState> getMealList();
  Future<MealListState> addMeal(List<FoodEntity> foods, TimeOfDay time);
  Future<MealListState> deleteMeal();
}
