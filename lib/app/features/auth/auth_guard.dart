import 'dart:async';

import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: "/signin");

  final authBloc = Modular.get<AuthBloc>();

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return authBloc.state is SignedInState;
  }
}
