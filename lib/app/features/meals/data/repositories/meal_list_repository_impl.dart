import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/repositories/meal_list_repository.dart';

class MealListRepositoryImpl implements MealListRepository {
  @override
  Future<MealEntity> addMeal(List<FoodEntity> foods) {
    // TODO: implement addMeal
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMeal() {
    // TODO: implement deleteMeal
    throw UnimplementedError();
  }

  @override
  Future<MealEntity> editMeal() {
    // TODO: implement editMeal
    throw UnimplementedError();
  }

  @override
  Future<List<MealEntity>> getMealList() {
    // TODO: implement getMealList
    throw UnimplementedError();
  }
}
