// ignore_for_file: prefer_const_constructors

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
      body: Padding(
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
                  //color: Color.fromARGB(255, 213, 225, 244),
                  child: Column(
                    children: [
                      Center(child: Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black45),)),
                    ],
                  )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
