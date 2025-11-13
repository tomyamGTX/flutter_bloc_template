import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/counter_cubit.dart';
import 'package:flutter_bloc_template/bloc/theme_cubit.dart';
import 'package:flutter_bloc_template/screens/home_page.dart';

void main() {
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
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // optional, cleaner UI
            themeMode: themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
