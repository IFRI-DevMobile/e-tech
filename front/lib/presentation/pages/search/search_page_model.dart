class SearchPageModel {
  final String id;
  final String nom;
  final double prix;
  final String? imageUrl;
  final String categorie;

  SearchPageModel({
    required this.id,
    required this.nom,
    required this.prix,
    this.imageUrl,
    required this.categorie,
  });
}