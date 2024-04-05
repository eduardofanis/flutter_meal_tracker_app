import 'package:flutter/material.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/data/models/sign_up_credentials_model.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/events/auth_event.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:string_validator/string_validator.dart' as validator;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatedPasswordController = TextEditingController();

  final authBloc = Modular.get<AuthBloc>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: nameController,
              validator: (name) {
                if (name!.isEmpty) {
                  return "Name field is necessary.";
                }

                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: emailController,
              validator: (email) {
                if (email!.isEmpty) {
                  return "Email field is necessary.";
                }

                if (!validator.isEmail(email)) {
                  return "Needs to be a valid email.";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Email")),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Password field is necessary.";
                  }

                  if (password.length < 6) {
                    return "The minimum password length is 6.";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Password"))),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: repeatedPasswordController,
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Password field is necessary.";
                  }

                  if (password.length < 6) {
                    return "The minimum password length is 6.";
                  }

                  if (password != passwordController.text) {
                    return "The passwords don't match.";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Confirm password"))),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  authBloc.add(SignUpEvent(SignUpCredentialsModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    repeatedPassword: repeatedPasswordController.text,
                  )));
                },
                child: const Text("Sign Up")),
            TextButton(
                onPressed: () => Modular.to.navigate("/"),
                child: const Text("Go to Sign In"))
          ],
        ),
      ),
    );
  }
}
