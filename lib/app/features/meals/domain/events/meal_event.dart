import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';

abstract class MealEvent {}

class AddFood implements MealEvent {
  final FoodEntity food;

  AddFood(this.food);
}

class DeleteFood implements MealEvent {
  final String id;

  DeleteFood(this.id);
}
