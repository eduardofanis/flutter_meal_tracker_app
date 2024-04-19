import 'dart:convert';

import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  MealModel({required super.foods, required super.time, required super.name})
      : super(
          carbohydrates: _sumNutrient(foods, (food) => food.carbohydrates),
          proteins: _sumNutrient(foods, (food) => food.proteins),
          fats: _sumNutrient(foods, (food) => food.fats),
          calories: _sumNutrient(foods, (food) => food.calories),
        );

  static double _sumNutrient(
      List<FoodEntity> foods, double Function(FoodEntity) nutrientSelector) {
    return foods.fold(0, (sum, food) => sum + nutrientSelector(food));
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'time': time,
      'foods': foods,
    };
  }

  static MealModel fromMap(Map<String, dynamic> map) {
    return MealModel(name: map['name'], foods: map['foods'], time: map['time']);
  }

  String toJson() => toMap().toString();

  static MealModel fromJson(String source) => fromMap(jsonDecode(source));
}
