import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/errors/auth_errors.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<AuthState> signIn(SignInCredentialsEntity credentials) async {
    try {
      final user =
          await datasource.signIn(credentials.email, credentials.password);
      return SignedInState(user);
    } catch (e) {
      return ErrorState(InternalError());
    }
  }

  @override
  Future<AuthState> signUp(SignUpCredentialsEntity credentials) async {
    try {
      final user = await datasource.signUp(
          credentials.name, credentials.email, credentials.password);
      return SignedInState(user);
    } catch (e) {
      return ErrorState(InternalError());
    }
  }

  @override
  Future<AuthState> signOut() {
    throw UnimplementedError();
  }
}
