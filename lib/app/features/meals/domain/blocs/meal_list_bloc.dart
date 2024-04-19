// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/events/meal_list_event.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/repositories/meal_list_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/states/meal_list_state.dart';

class MealListBloc extends Bloc<MealListEvent, MealListState> {
  final MealListRepository repository;

  MealListBloc(this.repository) : super(StartState()) {
    on<GetMealsEvent>((event, emit) async {
      final newState = await repository.getMealList();
      emit(newState);
    });
  }
}
