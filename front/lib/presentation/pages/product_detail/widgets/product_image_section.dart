/*import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  final String imageUrl;
  final bool hasDiscount;
  final double discountPercentage;

  const ProductImageSection({
    Key? key,
    required this.imageUrl,
    required this.hasDiscount,
    required this.discountPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.grey[100],
      child: Stack(
        children: [
          // Image
          Center(
            child: Image.network(
              imageUrl,
              height: 250,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.watch, size: 150);
              },
            ),
          ),
          
          // Badge PROMO
          if (hasDiscount)
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '-${discountPercentage.toInt()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}*/