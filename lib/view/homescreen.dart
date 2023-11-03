import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:recipeapp/model/foodrecipe.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  List<FoodRecipeModel> postlist = [];
  Future<List<FoodRecipeModel>> getFoodApi() async {
    final response = await http.get(Uri.parse(
        "https://api.spoonacular.com/recipes/findByNutrients?minCarbs=10&maxCarbs=50&number=2&apiKey=0586a0c41856403fa4e6f11506f2b95f"));
    var data = jsonDecode(response.body.toString());
    postlist.clear();
    if (response.statusCode == 200) {
      for (Map i in data) {
        postlist.add(FoodRecipeModel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }
 @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text("RecipeApp"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
          
            const SizedBox(height: 20),
           
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Container(
                color: Color.fromARGB(255, 237, 237, 246),
                height: height,
                width: Width,
                child: FutureBuilder(
                    future: getFoodApi(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SpinKitFadingCircle(
                            size: 60,
                            color: Color.fromARGB(255, 7, 255, 201),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: postlist.length,
                            itemBuilder: (context, index) {
                              return Card(
                                
                                child: Column(
                                  children: [
                                    Text(postlist[index].title.toString()),
                                    CachedNetworkImage(
                                          imageUrl:postlist[index].image.toString()),
                                  ],
                                )
                                ,
                              );
                            });
                      }
                    }),
              ),
            )
          ],
        ));
  }
}
