import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme_cubit.dart';
import '../../auth/cubit/auth_cubit.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), centerTitle: true),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// THEME SWITCH
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                final isDark = themeMode == ThemeMode.dark;

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                  title: const Text("Dark Mode"),
                  trailing: Switch.adaptive(
                    value: isDark,
                    thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                      (_) => isDark
                          ? const Icon(Icons.nightlight, color: Colors.white)
                          : const Icon(Icons.wb_sunny, color: Colors.yellow),
                    ),
                    onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            /// SIGN OUT
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Sign Out"),
              onTap: () => _signOut(context),
            ),
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext ctx) {
    ctx.read<AuthCubit>().authRepo.signOut();
  }
}
