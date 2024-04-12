import 'package:flutter_meal_tracker_app/app/core/utils/snackbar_message.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_in_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/entities/sign_up_credentials_entity.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/errors/auth_errors.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/data/datasources/storage_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  final StorageDatasource storage;

  AuthRepositoryImpl(this.datasource, this.storage);

  final snackBarMesssage = SnackBarMessage();

  @override
  Future<AuthState> signIn(SignInCredentialsEntity credentials) async {
    try {
      final user =
          await datasource.signIn(credentials.email, credentials.password);

      await storage.write("accessToken", user.accessToken);
      await storage.write("refreshToken", user.refreshToken);

      Modular.to.navigate("/");

      return SignedInState(user);
    } catch (e) {
      return ErrorState(InternalError("Error trying sign in"));
    }
  }

  @override
  Future<AuthState> signUp(SignUpCredentialsEntity credentials) async {
    try {
      final user = await datasource.signUp(
          credentials.name, credentials.email, credentials.password);

      await storage.write("accessToken", user.accessToken);
      await storage.write("refreshToken", user.refreshToken);

      Modular.to.navigate("/");

      return SignedInState(user);
    } catch (e) {
      return ErrorState(InternalError("Error trying sign up"));
    }
  }

  @override
  Future<AuthState> signOut() async {
    try {
      await storage.delete("accessToken");
      await storage.delete("refreshToken");

      return SignedOutState();
    } catch (e) {
      return ErrorState(InternalError("Error trying sign out"));
    }
  }

  @override
  Future<AuthState> validateSession(
      String? accessToken, String? refreshToken) async {
    try {
      if (accessToken != null && refreshToken != null) {
        final checkedUser =
            await datasource.validateSession(accessToken, refreshToken);

        return SignedInState(checkedUser);
      }
      return SignedOutState();
    } catch (e) {
      return ErrorState(InternalError("Error trying validate session"));
    }
  }
}
