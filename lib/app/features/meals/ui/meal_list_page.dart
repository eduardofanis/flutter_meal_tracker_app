import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/blocs/meal_list_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/events/meal_list_event.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/domain/states/meal_list_state.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MealListPage extends StatefulWidget {
  const MealListPage({super.key});

  @override
  State<MealListPage> createState() => _MealListPageState();
}

class _MealListPageState extends State<MealListPage> {
  final mealListBloc = Modular.get<MealListBloc>();

  @override
  void initState() {
    super.initState();
    mealListBloc.add(GetMealsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealListBloc, MealListState>(
        bloc: mealListBloc,
        builder: (context, state) {
          if (state is SuccessState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.list[index].name),
                  trailing: Text(state.list[index].time.format(context)),
                );
              },
            );
          }
          return const Center(
            child: Text("Meals"),
          );
        });
  }
}
