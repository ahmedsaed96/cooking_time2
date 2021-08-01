import 'ingredients_model.dart';

class Meal {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  List<MealIngredients>? mealIngerientd = [];
  Meal(
      {this.idMeal,
      this.strMeal,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.mealIngerientd});

  factory Meal.fromJson(Map<String, dynamic> map) {
    final x = <MealIngredients>[];

    for (int i = 1; i < 21; i++) {
      final strIngredient = map['strIngredient$i'] as String;
      final strMeasure = map['strMeasure$i'] as String;
      if (strIngredient != "" && strMeasure != " ") {
        x.add(MealIngredients(
            ingredientItem: strIngredient, measure: strMeasure));
      }
    }
    return Meal(
      idMeal: map['idMeal'] as String,
      mealIngerientd: x,
      strMeal: map['strMeal'] as String,
      strCategory: map['strCategory'] as String,
      strArea: map['strArea'] as String,
      strInstructions: map['strInstructions'] as String,
      strMealThumb: map['strMealThumb'] as String,
    );
  }
  @override
  String toString() {
    return "super.toString()";
  }
}
