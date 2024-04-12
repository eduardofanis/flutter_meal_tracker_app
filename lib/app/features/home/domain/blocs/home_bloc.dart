import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/events/home_event.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(PageState(page: 0)) {
    on<PageChangeEvent>((event, emit) {
      event.controller.animateToPage(event.page,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
      emit(PageState(page: event.page));
    });
  }
}
