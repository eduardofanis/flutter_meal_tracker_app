import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  MealModel({
    required super.foods,
    required super.time,
  }) : super(
          carbohydrates: _sumNutrient(foods, (food) => food.carbohydrates),
          proteins: _sumNutrient(foods, (food) => food.proteins),
          fats: _sumNutrient(foods, (food) => food.fats),
          calories: _sumNutrient(foods, (food) => food.calories),
        );

  static double _sumNutrient(
      List<FoodEntity> foods, double Function(FoodEntity) nutrientSelector) {
    return foods.fold(0, (sum, food) => sum + nutrientSelector(food));
  }
}
