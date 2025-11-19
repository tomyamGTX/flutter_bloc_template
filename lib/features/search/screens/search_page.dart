import 'package:flutter/material.dart';

import '../components/business_card.dart';
import '../models/business_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = "All";
  String selectedLocation = "All";
  double selectedRating = 0.0;

  final TextEditingController searchController = TextEditingController();
  final List<BusinessModel> businessList = [
    BusinessModel(
      id: "b1",
      name: "Warung Nasi Lemak Padu",
      category: "Food",
      city: "Shah Alam",
      state: "Selangor",
      rating: 4.7,
      reviews: 102,
      images: [
        "https://th.bing.com/th/id/OIP.QDiZPPePxcazamFX6pRvNgHaFj?w=234&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      ],
      description: "Homemade nasi lemak with spicy sambal and crispy chicken.",
      phone: "012-3456789",
      address: "Seksyen 7, Shah Alam",
      isVerified: true,
      lat: 3.073,
      lng: 101.518,
      priceRange: "\$",
    ),

    BusinessModel(
      id: "b2",
      name: "FixRight Phone Repair",
      category: "Services",
      city: "Kuala Lumpur",
      state: "Kuala Lumpur",
      rating: 4.4,
      reviews: 88,
      images: [
        "https://th.bing.com/th/id/OIP.QDiZPPePxcazamFX6pRvNgHaFj?w=234&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      ],
      description: "Expert phone and tablet repair with quick service.",
      phone: "017-9988776",
      address: "Bukit Bintang, Kuala Lumpur",
      isVerified: true,
      lat: 3.146,
      lng: 101.698,
      priceRange: "\$\$",
    ),

    BusinessModel(
      id: "b3",
      name: "Eco Laundry Express",
      category: "Services",
      city: "Johor Bahru",
      state: "Johor",
      rating: 4.2,
      reviews: 61,
      images: [
        "https://th.bing.com/th/id/OIP.QDiZPPePxcazamFX6pRvNgHaFj?w=234&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      ],
      description: "24-hour self-service laundry with premium machines.",
      phone: "013-1112233",
      address: "Taman Mount Austin, JB",
      isVerified: false,
      lat: 1.554,
      lng: 103.777,
      priceRange: "\$",
    ),

    BusinessModel(
      id: "b4",
      name: "Kopi Hijau Café",
      category: "Food",
      city: "George Town",
      state: "Penang",
      rating: 4.8,
      reviews: 210,
      images: [
        "https://th.bing.com/th/id/OIP.QDiZPPePxcazamFX6pRvNgHaFj?w=234&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      ],
      description: "Specialty coffee, cakes, and cozy workspace.",
      phone: "014-4455667",
      address: "Lebuh Armenian, George Town",
      isVerified: true,
      lat: 5.416,
      lng: 100.332,
      priceRange: "\$\$",
    ),

    BusinessModel(
      id: "b5",
      name: "BatikCraft Handmade",
      category: "Shops",
      city: "Kota Bharu",
      state: "Kelantan",
      rating: 4.6,
      reviews: 73,
      images: [
        "https://th.bing.com/th/id/OIP.QDiZPPePxcazamFX6pRvNgHaFj?w=234&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
      ],
      description: "Authentic Malaysian batik and handmade gifts.",
      phone: "016-2233445",
      address: "Wakaf Che Yeh, Kota Bharu",
      isVerified: false,
      lat: 6.118,
      lng: 102.245,
      priceRange: "\$\$",
    ),
  ];

  final List<String> categories = [
    "All",
    "Food",
    "Services",
    "Shops",
    "Freelancers",
    "Health",
  ];

  final List<String> locations = [
    "All",
    "Kuala Lumpur",
    "Selangor",
    "Penang",
    "Johor",
    "Sabah",
    "Sarawak",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),

      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterChips(),
          const Divider(),

          // Placeholder for business list
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final b = filteredList[index];
                return BusinessCard(business: b);
              },
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------
  // 🔍 Search Bar
  // -----------------------
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search businesses…",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _openFilterSheet,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  // -----------------------
  // 🏷 Filter Chips
  // -----------------------
  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Category chip
          FilterChip(
            label: Text("Category: $selectedCategory"),
            selected: selectedCategory != "All",
            onSelected: (_) => _selectCategory(),
          ),

          const SizedBox(width: 10),

          // Location chip
          FilterChip(
            label: Text("Location: $selectedLocation"),
            selected: selectedLocation != "All",
            onSelected: (_) => _selectLocation(),
          ),

          const SizedBox(width: 10),

          // Rating chip
          FilterChip(
            label: Text("Rating ≥ ${selectedRating.toStringAsFixed(1)}"),
            selected: selectedRating > 0,
            onSelected: (_) => _selectRating(),
          ),
        ],
      ),
    );
  }

  // -----------------------
  // 🟧 Bottom Sheet for full filters
  // -----------------------
  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "More Filters",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Category"),
                  DropdownButton(
                    value: selectedCategory,
                    items: categories
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) {
                      setState(() => selectedCategory = v!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Location"),
                  DropdownButton(
                    value: selectedLocation,
                    items: locations
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) {
                      setState(() => selectedLocation = v!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Rating slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Minimum Rating"),
                  Slider(
                    value: selectedRating,
                    min: 0,
                    max: 5,
                    divisions: 10,
                    label: selectedRating.toStringAsFixed(1),
                    onChanged: (v) => setState(() => selectedRating = v),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // -----------------------
  // Shortcuts to set filters
  // -----------------------
  void _selectCategory() async {
    final result = await _simpleSelectDialog("Select Category", categories);
    if (result != null) setState(() => selectedCategory = result);
  }

  void _selectLocation() async {
    final result = await _simpleSelectDialog("Select Location", locations);
    if (result != null) setState(() => selectedLocation = result);
  }

  void _selectRating() async {
    final result = await showDialog<double>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Minimum Rating"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: selectedRating,
                  min: 0,
                  max: 5,
                  divisions: 10,
                  onChanged: (v) => setState(() => selectedRating = v),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, selectedRating),
                child: const Text("Apply"),
              ),
            ],
          );
        },
      ),
    );

    if (result != null) setState(() => selectedRating = result);
  }

  // Generic selection popup
  Future<String?> _simpleSelectDialog(String title, List<String> items) {
    return showDialog<String>(
      context: context,
      builder: (_) => SimpleDialog(
        title: Text(title),
        children: items
            .map(
              (e) => SimpleDialogOption(
                child: Text(e),
                onPressed: () => Navigator.pop(context, e),
              ),
            )
            .toList(),
      ),
    );
  }

  List<BusinessModel> get filteredList {
    final query = searchController.text.toLowerCase();

    return businessList.where((b) {
      final matchSearch =
          b.name.toLowerCase().contains(query) ||
          b.category.toLowerCase().contains(query) ||
          b.city.toLowerCase().contains(query) ||
          b.state.toLowerCase().contains(query);

      final matchCategory =
          selectedCategory == "All" || b.category == selectedCategory;
      final matchLocation =
          selectedLocation == "All" || b.state == selectedLocation;
      final matchRating = b.rating >= selectedRating;

      return matchSearch && matchCategory && matchLocation && matchRating;
    }).toList();
  }
}
