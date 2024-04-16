abstract class MealListEvent {}

class GetMealsEvent implements MealListEvent {
  final String? searchText;

  GetMealsEvent(this.searchText);
}

class AddMealEvent implements MealListEvent {}

class DeleteMealEvent implements MealListEvent {
  final String id;

  DeleteMealEvent(this.id);
}
