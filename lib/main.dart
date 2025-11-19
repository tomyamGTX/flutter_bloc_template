import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/core/widgets/auth_gate.dart';
import 'package:flutter_bloc_template/features/auth/repository/firebase_auth_repository.dart';
import 'package:flutter_bloc_template/theme/theme_cubit.dart';

import 'features/auth/cubit/auth_cubit.dart';
import 'features/home/cubit/counter_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlutterBlocTemplate());
}

class FlutterBlocTemplate extends StatelessWidget {
  const FlutterBlocTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => AuthCubit(FirebaseAuthRepository())),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // optional, cleaner UI
            themeMode: themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const AuthGate(),
          );
        },
      ),
    );
  }
}

// Promote local shops
//
// Food recommendations by area
//
// Review system
