import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipeapp/repository/food_repository.dart';

class SearchScreen extends SearchDelegate {
 FoodRecipeRepository _foodList = FoodRecipeRepository();

 
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: _foodList.getfoodList(query: query),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitFadingCircle(
                size: 60,
                color: Color.fromARGB(255, 7, 255, 201),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          child: CachedNetworkImage(
                              imageUrl: data[index].image.toString()),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(data[index].title.toString()),
                      ],
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Recipe'),
    );
  }
}
