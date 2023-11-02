import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipeapp/model/foodrecipe.dart';
import 'package:recipeapp/view_model/foodrecipe_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  FoodViewModel foodViewModel = FoodViewModel();
  Widget build(BuildContext context) {
    final Width = MediaQuery.sizeOf(context).width * 1 ;
    final height = MediaQuery.sizeOf(context).height * 1;


    return Scaffold(
      appBar: AppBar(
        title:const Text("RecipeApp"),
        centerTitle: true,
      ),body: ListView(
        children: [
          Container(
            height: height * 45,
            width: Width,
            child: FutureBuilder<FoodRecipeModel>(
              future: foodViewModel.fetchSimilarRecipesApi(),
               builder: (BuildContext context, AsyncSnapshot<dynamic>  snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: 
                     SpinKitFadingCircle(
                      size: 60,
                      color: Color.fromARGB(255, 7, 255, 201),
                     ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index)
                    {
                      return Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          child: CachedNetworkImage(
                            imageUrl:snapshot.data[index].urlToImage.toString() ),
                        )
                      ],),
                    
                  );
                    });
                }
               }
               ),
          )
        ],
      )
    );
  }
}