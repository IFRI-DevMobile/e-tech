/*class Product {
  // Caractéristiques du produit
  final String id;              // Identifiant unique
  final String name;            // Nom : "Smart Watch"
  final double rating;          // Note : 5.0
  final int reviewCount;        // Nombre d'avis : 7932
  final String description;     // Description
  final double price;           // Prix actuel : 160.00
  final double? oldPrice;       // Ancien prix : 162.99 (optionnel)
  final List<String> sizes;     // Tailles : ["S", "M", "L", "XL"]
  final List<String> colors;    // Couleurs : ["Noir", "Bleu"]
  final List<String> imageUrls; // URLs des images

  // Constructeur
  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.sizes,
    required this.colors,
    required this.imageUrls,
  });

  // Méthode pour vérifier s'il y a une promo
  bool get hasDiscount => oldPrice != null && oldPrice! > price;

  // Calculer le pourcentage de réduction
  double get discountPercentage {
    if (!hasDiscount) return 0;
    return ((oldPrice! - price) / oldPrice! * 100).roundToDouble();
  }
}*/