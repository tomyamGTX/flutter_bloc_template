import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/auth/screens/sign_in_page.dart';

import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/models/appuser.dart';
import '../../features/counter/screens/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AppUser?>(
      builder: (context, user) {
        // Logged in
        if (user != null) {
          return const HomePage();
        }

        // Not logged in
        return const SignInPage();
      },
    );
  }
}
