import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/models/sign_in_credentials_model.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/models/user_model.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {
  @override
  Future<AuthState> signIn(SignInCredentialsEntity credentials) async {
    final user = UserModel(
        email: "email", name: "name", accessToken: '', refreshToken: '');
    return Future(() => SignedInState(user));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  blocTest<AuthBloc, AuthState>(
    "Must return a SignedInState",
    build: () => AuthBloc(repository),
    act: (bloc) => bloc.add(SignInEvent(SignInCredentialsModel(
      email: "email",
      password: "password",
    ))),
    expect: () => [
      isA<LoadingState>(),
      isA<SignedInState>(),
    ],
  );
}
