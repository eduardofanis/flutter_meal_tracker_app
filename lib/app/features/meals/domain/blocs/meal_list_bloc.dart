import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/events/meal_list_event.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/states/meal_list_state.dart';

class MealListBloc extends Bloc<MealListEvent, MealListState> {
  MealListBloc() : super(StartState()) {
    on<AddMealEvent>((event, emit) {
      emit(LoadingState());
    });
  }
}
