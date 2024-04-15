import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_meal_tracker_app/app/features/goals/ui/goals_page.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/blocs/home_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/events/home_event.dart';
import 'package:flutter_meal_tracker_app/app/features/home/domain/states/home_state.dart';
import 'package:flutter_meal_tracker_app/app/features/meals/ui/meals_page.dart';
import 'package:flutter_meal_tracker_app/app/features/recipes/ui/recipes_page.dart';
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
  final storage = Modular.get<StorageRepository>();
  late PageController pageController;

  validateSession() async {
    final accessToken = await storage.read("accessToken");
    final refreshToken = await storage.read("refreshToken");
    authBloc.add(ValidateSessionEvent(accessToken, refreshToken));
  }

  @override
  void initState() {
    super.initState();
    validateSession();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: PageView(
              controller: pageController,
              onPageChanged: (page) {
                homeBloc.add(PageChangeEvent(page));
              },
              children: const [
                Text("Home"),
                MealsPage(),
                RecipesPage(),
                GoalsPage(),
              ],
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        authBloc.add(SignOutEvent());
                      },
                      child: const Text("Logout")),
                ],
              ),
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
                  icon: Icon(Icons.dinner_dining),
                  label: "Meals",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: "Recipes",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.flag),
                  label: "Goals",
                ),
              ],
              onTap: (page) {
                homeBloc.add(PageChangeEvent(page));
                pageController.animateToPage(page,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {},
            ),
          );
        });
  }
}
