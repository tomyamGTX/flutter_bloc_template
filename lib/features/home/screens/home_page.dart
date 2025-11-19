import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search/screens/search_page.dart';
import '../../setting/screens/setting.dart';
import '../components/category_card.dart';
import '../components/feature_card.dart';
import '../cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyLokal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchPage()),
              );
            },
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search local businesses…",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.4),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🏷 Categories
            Text(
              "Browse Categories",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(icon: Icons.restaurant, label: "Food"),
                  CategoryCard(icon: Icons.design_services, label: "Services"),
                  CategoryCard(icon: Icons.storefront, label: "Shops"),
                  CategoryCard(icon: Icons.work, label: "Freelancers"),
                  CategoryCard(icon: Icons.local_hospital, label: "Health"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ⭐ Featured Section
            Text(
              "Featured This Week",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            FeaturedCard(
              title: "Warung Nasi Lemak Padu",
              location: "Shah Alam",
              image:
                  "https://th.bing.com/th/id/OIP.QDiZPPePxcazamFX6pRvNgHaFj?w=234&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
            ),

            const SizedBox(height: 12),

            FeaturedCard(
              title: "Faris Car Wash",
              location: "Johor Bahru",
              image:
                  "https://image.made-in-china.com/2f0j00fMRUpLaKTlbT/Leisu-Wash-360-Fully-Automatic-Touchless-Car-Wash-Machine-with-3-Years-Warranty.jpg",
            ),

            const SizedBox(height: 40),

            // 🔢 Counter Cubit (kept for testing)
            Center(
              child: BlocBuilder<CounterCubit, int>(
                builder: (context, count) => Text(
                  "Debug Counter: $count",
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
