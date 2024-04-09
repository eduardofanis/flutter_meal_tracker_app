import 'package:bloc/bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(const IdleState()) {
    on<SignInEvent>((event, emit) async {
      final newState = await repository.signIn(event.credentials);
      emit(newState);
    });

    on<SignUpEvent>((event, emit) async {
      final newState = await repository.signUp(event.credentials);
      emit(newState);
    });

    on<SignOutEvent>((event, emit) async {
      final newState = await repository.signOut();
      emit(newState);
    });

    on<CheckAuthStateEvent>((event, emit) async {
      final newState = await repository.checkAuthState(event.token);
      emit(newState);
    });
  }
}
