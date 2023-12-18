class Ingredient {
  final String name;
  final double amount;
  final String unit;
  Ingredient({required this.name, required this.amount, required this.unit});

  static Ingredient fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        amount: json["amount"]["value"].toDouble(),
        unit: json["amount"]["unit"],
      );
}
