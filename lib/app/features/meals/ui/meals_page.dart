import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/blocs/meal_list_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/states/meal_list_state.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({super.key});

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  final mealListBloc = Modular.get<MealListBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealListBloc, MealListState>(
        bloc: mealListBloc,
        builder: (context, state) {
          if (state is SuccessState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return const ListTile();
              },
            );
          }
          return const Center(
            child: Text("Meals"),
          );
        });
  }
}
