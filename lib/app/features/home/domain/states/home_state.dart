abstract class HomeState {
  final int page;

  HomeState({required this.page});
}

class PageState extends HomeState {
  PageState({required super.page});
}
