import 'product_model.dart';

class Category {
  final int id;
  final String name;
  final String? icon;
  final List<Product>? products;

  Category({
    required this.id,
    required this.name,
    this.icon,
    this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Sans nom',
      icon: json['icon'],
      products: json['products'] != null
          ? List<Product>.from(
              json['products'].map((x) => Product.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'products': products?.map((x) => x.toJson()).toList(),
      };
}
