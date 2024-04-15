import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

abstract class MealListRepository {
  Future<List<MealEntity>> getMeals(String? searchText);
  Future<MealEntity> addMeal();
  Future<void> deleteMeal();
}
