import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeapp/model/foodrecipe.dart';

class FoodRepository {
  List<FoodRecipeModel> postlist = [];
  Future<List<FoodRecipeModel>> getFoodApi () async {
    final response = await http.get(Uri.parse("https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2&apiKey=0586a0c41856403fa4e6f11506f2b95f"));
    var data = jsonDecode(response.body.toString());
    postlist.clear();
    if(response.statusCode == 200){
      for(Map i in data){
        postlist.add(FoodRecipeModel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

}


