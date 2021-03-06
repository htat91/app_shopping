import 'package:flutter/material.dart';

class Categories{
  int id;
  String title;
  String image;
  int cateID;
  Categories({required this.id, required this.title, required this.image, required this.cateID});

  static List<Categories> init(){
    List<Categories> data= [
      Categories(id:1, title: "HighLand", image: "assets/images/ic_highland.jpeg", cateID: 1 ),
      Categories(id:2, title: "HighLand", image: "assets/images/ic_circlek.png", cateID: 2 ),
      Categories(id:3, title: "HighLand", image: "assets/images/ic_ministop.png", cateID: 3 ),
      Categories(id:4, title: "HighLand", image: "assets/images/ic_seveneleven.png", cateID: 4 ),
      Categories(id:5, title: "HighLand", image: "assets/images/ic_vinmart.jpg", cateID: 5 ),
    ];
    return data;
  }
}
