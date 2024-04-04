import 'package:bloc/bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(const IdleState()) {
    on<AuthEvent>((event, emit) async {
      emit(const LoadingState());
      if (event is SignInEvent) {
        final newState = await repository.signIn(event.signInCredentials);
        emit(newState);
      }

      if (event is SignUpEvent) {
        final newState = await repository.signUp(event.signUpCredentials);
        emit(newState);
      }

      if (event is SignOutEvent) {
        final newState = await repository.signOut();
        emit(newState);
      }
    });
  }
}
