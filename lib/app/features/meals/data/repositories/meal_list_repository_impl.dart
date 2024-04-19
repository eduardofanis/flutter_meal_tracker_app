import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/data/datasources/meal_list_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/repositories/meal_list_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/states/meal_list_state.dart';

class MealListRepositoryImpl implements MealListRepository {
  final MealListDatasource datasource;

  MealListRepositoryImpl(this.datasource);

  @override
  Future<MealListState> addMeal(List<FoodEntity> foods, TimeOfDay time) async {
    try {
      final list = await datasource.addMeal();
      return SuccessState(list);
    } catch (e) {
      return ErrorState();
    }
  }

  @override
  Future<MealListState> deleteMeal() async {
    try {
      final list = await datasource.deleteMeal();
      return SuccessState(list);
    } catch (e) {
      return ErrorState();
    }
  }

  @override
  Future<MealListState> getMealList() async {
    try {
      final list = await datasource.getMealList();
      return SuccessState(list);
    } catch (e) {
      return ErrorState();
    }
  }
}
