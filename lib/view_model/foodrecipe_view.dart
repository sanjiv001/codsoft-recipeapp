import 'package:recipeapp/model/foodrecipe.dart';
import 'package:recipeapp/repository/food_repository.dart';

class FoodViewModel {
  final _rep = FoodRepository();

  Future<List<FoodRecipeModel>> fetchSimilarRecipesApi() async {
    final response = await _rep.getFoodApi();
    return response ;
  }
}