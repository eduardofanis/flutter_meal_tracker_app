import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/models/sign_in_model.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  final repository = AuthRepositoryMock();
  final credentials = SignInModel(
    email: "eduardo.fanis@hotmail.com",
    password: "12345",
  );

  blocTest<AuthBloc, AuthState>(
    "Must return a SignedInState",
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(SignInEvent(credentials)),
    expect: () => [
      isA<LoadingState>(),
      isA<SignedInState>(),
    ],
  );
}
