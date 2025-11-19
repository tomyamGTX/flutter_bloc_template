import 'package:flutter/material.dart';

import '../models/business_model.dart';

class BusinessCard extends StatelessWidget {
  final BusinessModel business;

  const BusinessCard({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Image.network(
              business.images.isNotEmpty
                  ? business.images.first
                  : "https://via.placeholder.com/150",
              height: 100,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  business.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                // Category & location
                Text(
                  "${business.category} • ${business.city}",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),

                const SizedBox(height: 6),

                // Rating row
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    Text(
                      "${business.rating} (${business.reviews})",
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Price range
                Text(
                  business.priceRange,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
