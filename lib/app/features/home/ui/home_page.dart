import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/domain/repositories/storage_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authBloc = Modular.get<AuthBloc>();

  @override
  void initState() {
    super.initState();

    validateSession() async {
      final storage = Modular.get<StorageRepository>();

      final accessToken = await storage.read("accessToken");
      final refreshToken = await storage.read("refreshToken");

      authBloc.add(ValidateSessionEvent(accessToken, refreshToken));
    }

    validateSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<AuthBloc, AuthState>(
              bloc: authBloc,
              builder: (context, state) => Text(state.toString())),
          actions: [
            IconButton(
              onPressed: () {
                authBloc.add(SignOutEvent());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: const Text("Home"));
  }
}
