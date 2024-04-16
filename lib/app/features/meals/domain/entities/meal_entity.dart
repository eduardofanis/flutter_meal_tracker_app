import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';

abstract class MealEntity {
  final double carbohydrates;
  final double proteins;
  final double fats;
  final double calories;
  final TimeOfDay time;
  final List<FoodEntity> foods;

  MealEntity({
    required this.carbohydrates,
    required this.proteins,
    required this.fats,
    required this.calories,
    required this.time,
    required this.foods,
  });
}
