/*import 'package:flutter/material.dart';

class ProductColorSelector extends StatefulWidget {
  final List<String> colors;
  final ValueChanged<String> onColorSelected;

  const ProductColorSelector({
    Key? key,
    required this.colors,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  String? selectedColor;

  // Convertir le nom de couleur en Color Flutter
  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'noir': return Colors.black;
      case 'bleu': return Colors.blue;
      case 'rouge': return Colors.red;
      case 'vert': return Colors.green;
      case 'blanc': return Colors.white;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Couleur',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          
          const SizedBox(height: 12),
          
          Wrap(
            spacing: 12,
            children: widget.colors.map((color) {
              final isSelected = selectedColor == color;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = color;
                  });
                  widget.onColorSelected(color);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getColorFromString(color),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}*/