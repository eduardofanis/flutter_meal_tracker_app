import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/blocs/home_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/events/home_event.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/states/home_state.dart';
import 'package:flutter_meal_tracker_app/app/features/storage/domain/repositories/storage_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authBloc = Modular.get<AuthBloc>();
  final homeBloc = Modular.get<HomeBloc>();
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    (() async {
      final storage = Modular.get<StorageRepository>();
      final accessToken = await storage.read("accessToken");
      final refreshToken = await storage.read("refreshToken");
      authBloc.add(ValidateSessionEvent(accessToken, refreshToken));
    });

    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    authBloc.add(SignOutEvent());
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: (page) {
                homeBloc.add(PageChangeEvent(page, pageController));
              },
              children: const [Text("Home"), Text("Profile")],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.page,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
              onTap: (page) {
                homeBloc.add(PageChangeEvent(page, pageController));
              },
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {},
            ),
          );
        });
  }
}
