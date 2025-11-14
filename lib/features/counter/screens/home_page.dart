import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc_template/theme/theme_cubit.dart';

import '../cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLoC Template'),
        actions: [
          IconButton(
            onPressed: () => _signOut(context),
            icon: Icon(Icons.logout),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;

              return Switch.adaptive(
                value: isDark,
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                  if (isDark) {
                    return const Icon(Icons.nightlight, color: Colors.white);
                  } else {
                    return const Icon(Icons.wb_sunny, color: Colors.yellow);
                  }
                }),
                onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(child: Text('$count')),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }

  void _signOut(BuildContext ctx) {
    ctx.read<AuthCubit>().authRepo.signOut();
  }
}
