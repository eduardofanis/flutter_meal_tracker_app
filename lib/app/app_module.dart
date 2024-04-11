import 'package:flutter_meal_tracker_app/app/features/auth/auth_guard.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/datasources/firebase/firebase_auth_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/ui/sign_in_page.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/ui/sign_up_page.dart';
import 'package:flutter_meal_tracker_app/app/features/home/ui/home_page.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/data/datasources/flutter_secure_storage/flutter_secure_storage_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/data/datasources/storage_datasource.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/data/repositories/storage_repository_impl.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/domain/repositories/storage_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<FlutterSecureStorage>(FlutterSecureStorage.new);
    i.add<StorageDatasource>(FlutterSecureStorageDatasource.new);
    i.add<StorageRepository>(StorageRepositoryImpl.new);
    i.add<AuthDatasource>(FirebaseAuthDatasource.new);
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.addSingleton<AuthBloc>(AuthBloc.new,
        config: BindConfig(
          onDispose: (bloc) => bloc.close(),
        ));
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => AuthGuard(child: const HomePage()));
    r.child("/signin", child: (context) => const SignInPage());
    r.child("/signup", child: (context) => const SignUpPage());
  }
}
