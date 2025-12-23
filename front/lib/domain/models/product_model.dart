class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String imageUrl;
  final int categoryId;
  final bool isFavorite;
  final bool isNew;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.categoryId,
    this.isFavorite = false,
    this.isNew = false,
  });

  // Helper method to parse price from various types
  static double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) {
      return double.tryParse(price) ?? 0.0;
    }
    return 0.0;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Sans nom',
      description: json['description'] ?? '',
      price: _parsePrice(json['price']),
      stock: json['stock'] ?? 0,
      categoryId: json['category'] ?? 0,
      imageUrl: json['image_url'] ?? 'assets/images/placeholder.png',
      isNew: json['is_new'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'stock': stock,
        'image_url': imageUrl,
        'category': categoryId,
        'is_new': isNew,
      };

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? stock,
    String? imageUrl,
    int? categoryId,
    bool? isFavorite,
    bool? isNew,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      isFavorite: isFavorite ?? this.isFavorite,
      isNew: isNew ?? this.isNew,
    );
  }
}
