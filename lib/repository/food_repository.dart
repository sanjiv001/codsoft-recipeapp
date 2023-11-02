import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeapp/model/foodrecipe.dart';

class FoodRepository {
  Future<FoodRecipeModel> fetchSimilarRecipesApi() async {
    String url =
        "https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2&apiKey=0586a0c41856403fa4e6f11506f2b95f";

    final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return FoodRecipeModel.fromJson(body);
    }
    throw Exception("Error");
  }
}
