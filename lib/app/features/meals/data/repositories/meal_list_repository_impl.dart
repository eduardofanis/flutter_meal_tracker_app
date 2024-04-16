import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/data/datasources/meal_list_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/data/models/meal_model.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/repositories/meal_list_repository.dart';

class MealListRepositoryImpl implements MealListRepository {
  final MealListDatasource datasource;

  MealListRepositoryImpl(this.datasource);

  @override
  Future<List<MealEntity>> addMeal(
      List<FoodEntity> foods, TimeOfDay time) async {
    try {
      MealEntity meal = MealModel(foods: [], time: time);
      return [meal];
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<MealEntity>> deleteMeal() {
    // TODO: implement deleteMeal
    throw UnimplementedError();
  }

  @override
  Future<List<MealEntity>> getMealList() {
    // TODO: implement getMealList
    throw UnimplementedError();
  }
}
