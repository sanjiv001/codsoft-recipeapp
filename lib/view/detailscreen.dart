// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  int id;
  String title;
  String image;
  String imageType;
  int calories;
  String protein;
  String fat;
  String carbs;

  DetailScreen({
    Key? key,
    required this.calories,
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.protein,
    required this.fat,
    required this.carbs,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 12, 0),
          child: Container(
            color: Color.fromARGB(255, 241, 240, 237),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 260,
                  child: CachedNetworkImage(imageUrl: widget.image),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    height: 360,
                    
                    child: Column(
                      children: [
                        Center(child: Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black45),)),
                        Divider(height: 20, color: Colors.black45,),
                        Text( "Instruction", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(115, 28, 27, 27)),),
                        
                        Text( " It is sutaible for those who need these type of diet & nutrition of these; ", style: TextStyle(fontSize: 20,  color: Colors.black)),
                        SizedBox(height: 10,),
                        Center(
                          child: Column(
                            children: [
                              Center(
                                child: Row(
                                  children: [
                                    
                                    Text("protein:"),
                                    Text(  widget.protein, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromARGB(115, 28, 27, 27)),),
                                   
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                                Row(
                            children: [
                              
                              Text("Carbs:"),
                              Text(  widget.carbs, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(115, 28, 27, 27)),),
                             
                            ],
                          ),
                            SizedBox(height: 10,),
                          Center(
                            child: Row(
                              children: [
                                
                                Text("Calories:"),
                                Text(  widget.calories.toString(), style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromARGB(115, 28, 27, 27)),),
                               
                              ],
                            ),
                          ),
                            ],
                          ),
                        ),
                          
                      
                        
                       
                      ],
                    )),
                ),
               // Text("Instruction", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(115, 168, 165, 165)),),
                
              ],
            ),
            
                
          ),
        ),
      ),
    );
  }
}
