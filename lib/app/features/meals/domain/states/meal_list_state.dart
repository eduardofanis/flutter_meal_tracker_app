import 'package:flutter_meal_tracker_app/app/features/meals/domain/entities/meal_entity.dart';

abstract class MealListState {}

class StartState implements MealListState {}

class LoadingState implements MealListState {}

class ErrorState implements MealListState {}

class SuccessState implements MealListState {
  final List<MealEntity> list;

  SuccessState(this.list);
}
