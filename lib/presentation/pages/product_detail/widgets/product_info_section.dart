/*import 'package:flutter/material.dart';

class ProductInfoSection extends StatefulWidget {
  final String productName;
  final double rating;
  final int reviewCount;
  final String description;

  const ProductInfoSection({
    Key? key,
    required this.productName,
    required this.rating,
    required this.reviewCount,
    required this.description,
  }) : super(key: key);

  @override
  State<ProductInfoSection> createState() => _ProductInfoSectionState();
}

class _ProductInfoSectionState extends State<ProductInfoSection> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nom et note
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.productName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.rating}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Nombre d'avis
          Text(
            '${widget.rating} (${widget.reviewCount} avis)',
            style: const TextStyle(color: Colors.grey),
          ),
          
          const SizedBox(height: 16),
          
          // Description avec "Voir plus"
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                maxLines: showFullDescription ? null : 3,
                overflow: showFullDescription ? null : TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
              
              if (!showFullDescription)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showFullDescription = true;
                    });
                  },
                  child: const Text(
                    'Voir plus',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}*/