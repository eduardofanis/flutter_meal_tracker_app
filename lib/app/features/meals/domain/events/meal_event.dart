import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/food_entity.dart';

abstract class MealEvent {}

class AddFoodEvent implements MealEvent {
  final FoodEntity food;

  AddFoodEvent(this.food);
}

class DeleteFoodEvent implements MealEvent {
  final String id;

  DeleteFoodEvent(this.id);
}
