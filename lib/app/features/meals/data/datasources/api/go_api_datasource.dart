import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/data/datasources/meal_list_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/data/models/food_model.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/data/models/meal_model.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

class GoApiDatasource implements MealListDatasource {
  @override
  Future<List<MealEntity>> addMeal() async {
    final food = FoodModel(
        carbohydrates: 10, proteins: 10, fats: 10, calories: 10, name: "RIce");
    final meal = MealModel(
        foods: [food],
        time: const TimeOfDay(hour: 10, minute: 30),
        name: "Breakfast");

    return [meal];
  }

  @override
  Future<List<MealEntity>> deleteMeal() async {
    // TODO: implement deleteMeal
    throw UnimplementedError();
  }

  @override
  Future<List<MealEntity>> getMealList() async {
    final food = FoodModel(
        carbohydrates: 10, proteins: 10, fats: 10, calories: 10, name: "RIce");
    final meal = MealModel(
        foods: [food],
        time: const TimeOfDay(hour: 10, minute: 30),
        name: "Breakfast");

    return [meal];
  }
}
