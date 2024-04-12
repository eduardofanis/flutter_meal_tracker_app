// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class HomeEvent {}

class PageChangeEvent implements HomeEvent {
  final int page;

  PageChangeEvent(
    this.page,
  );
}
