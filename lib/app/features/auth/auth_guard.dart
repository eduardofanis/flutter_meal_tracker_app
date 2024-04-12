import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/blocs/auth_bloc.dart';
import 'package:flutter_meal_tracker_app/app/features/auth/domain/states/auth_state.dart';
import 'package:flutter_meal_tracker_app/app/utils/snackbar_message.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  AuthGuard({
    super.key,
    required this.child,
  });

  final authBloc = Modular.get<AuthBloc>();
  final snackBarMessage = SnackBarMessage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is! SignedInState) Modular.to.navigate("/signin");
        if (state is ErrorState) {
          snackBarMessage.showErrorSnackBar(
              message: state.error.message, context: context);
        }
      },
      child: child,
    );
  }
}
