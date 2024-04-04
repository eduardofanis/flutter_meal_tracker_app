import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/firebase/firebase_auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/ui/sign_in_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<AuthDatasource>(FirebaseAuthDatasource.new);
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.addSingleton<AuthBloc>(AuthBloc.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => const SignInPage());
  }
}
