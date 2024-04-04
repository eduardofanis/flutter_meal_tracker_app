import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/models/sign_in_model.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final bloc = Modular.get<AuthBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Email")),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Password"))),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  final credentials = SignInModel(
                      email: emailController.text,
                      password: passwordController.text);
                  bloc.add(SignInEvent(credentials));
                },
                child: const Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
