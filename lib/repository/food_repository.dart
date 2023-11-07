import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipeapp/model/foodrecipe.dart';

class FoodRecipeRepository {
  var data = [];
  List<FoodRecipeModel> results = [];
  String urlList = 'https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2&apiKey=0586a0c41856403fa4e6f11506f2b95f';

  Future<List<FoodRecipeModel>> getfoodList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => FoodRecipeModel.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.title!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}