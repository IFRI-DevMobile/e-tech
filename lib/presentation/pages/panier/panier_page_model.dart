

class PanierPageModel{
  final String nom;
  final String image;
  final double prix;
  int quantite;

  PanierPageModel({
    required this.nom,
    required this.image,
    required this.prix,
    this.quantite = 1,
  });

}
