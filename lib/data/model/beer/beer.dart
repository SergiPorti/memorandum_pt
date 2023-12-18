import 'package:memorandum_pt/data/model/beer/ingredient.dart';

class Beer {
  final int id;
  final String name;
  final String shortDescription;
  final String firstElaboration;
  final String description;
  final String imageUrl;
  final List<Ingredient> ingredients;
  final List<String>? foodPairing;
  Beer(
      {required this.id,
      required this.name,
      required this.shortDescription,
      required this.firstElaboration,
      required this.description,
      required this.imageUrl,
      required this.foodPairing,
      required this.ingredients});

  static Beer fromJson(Map<String, dynamic> json) => Beer(
        id: json["id"],
        name: json["name"],
        shortDescription: json["tagline"],
        firstElaboration: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        ingredients: _getIngredients(json["ingredients"]["malt"]),
        foodPairing: List<String>.from(json["food_pairing"]),
      );

  static List<Ingredient> _getIngredients(List<dynamic> json) {
    List<Ingredient> ingredients = [];
    ingredients.addAll(
        json.map<Ingredient>((item) => Ingredient.fromJson(item)).toList());
    return ingredients;
  }
}
