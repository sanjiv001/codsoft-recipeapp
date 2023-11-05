// ignore_for_file: prefer_final_fields

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipeapp/repository/food_repository.dart';
import 'package:recipeapp/view/searchapi.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //FoodRepository _fetchpostList = FoodRepository();
 FoodRecipeRepository _foodList = FoodRecipeRepository();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RecipeApp"),
        centerTitle: true,
        actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchScreen());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
      ),
      body: Stack(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Column(
              children: [
                // Note: Same code is applied for the TextFormField as well
              //   InkWell(
              //   onTap: Navigator.of(context).pushReplacement(MaterialPage(child: (context)=> SearchScreen)),
              //    child: const Padding(
              //       padding:  EdgeInsets.all(8.0),
              //       child:  TextField(
              //      //  onChanged: (value) => applyfilter(value),
              //         decoration: InputDecoration(
              //           labelText: 'search',
              //           suffixIcon: Icon(Icons.search_outlined),
                        
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(
                            
              //                 width: 2, color: Color.fromARGB(255, 49, 98, 75),), //<-- SEE HERE
              //           ),
              //           disabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(
                            
              //                 width: 2, color: Color.fromARGB(255, 67, 49, 98),), //<-- SEE HERE
              //           ),
              //         ),
              //       ),
              //     ),
              //  ),
                
                Expanded(
                  child: FutureBuilder(
                      future: _foodList.getfoodList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                            var data = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                            imageUrl: data[index]
                                                .image
                                                .toString()),
                                      ),
                                       const SizedBox(width: 20,),
                                      Text(data[index].title.toString()),
                                    ],
                                  ),
                                );
                              });
                        }
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
