import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

abstract class MealListDatasource {
  Future<List<MealEntity>> addMeal();
  Future<List<MealEntity>> deleteMeal();
}
