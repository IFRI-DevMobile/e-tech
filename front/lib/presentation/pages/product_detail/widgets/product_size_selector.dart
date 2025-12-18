/*import 'package:flutter/material.dart';

class ProductSizeSelector extends StatefulWidget {
  final List<String> sizes;
  final ValueChanged<String> onSizeSelected;

  const ProductSizeSelector({
    Key? key,
    required this.sizes,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choisir une taille',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          
          const SizedBox(height: 12),
          
          Wrap(
            spacing: 8,
            children: widget.sizes.map((size) {
              final isSelected = selectedSize == size;
              return ChoiceChip(
                label: Text(size),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    selectedSize = size;
                  });
                  widget.onSizeSelected(size);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}*/