// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class HomeEvent {}

class PageChangeEvent implements HomeEvent {
  final int page;
  final PageController controller;

  PageChangeEvent(
    this.page,
    this.controller,
  );
}
