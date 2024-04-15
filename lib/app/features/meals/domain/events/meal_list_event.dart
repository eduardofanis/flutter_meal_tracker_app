abstract class MealListEvent {}

class GetMeals implements MealListEvent {
  final String? searchText;

  GetMeals(this.searchText);
}

class AddMeal implements MealListEvent {}

class DeleteMeal implements MealListEvent {
  final String id;

  DeleteMeal(this.id);
}
