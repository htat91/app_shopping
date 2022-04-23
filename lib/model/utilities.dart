import 'dart:convert';


import 'package:app_shopping/model/products.dart';
import 'package:http/http.dart' as http ;
import 'package:quiver/strings.dart';

class Utilities {
  String url = 'http://192.168.0.100:3000/api/food';

  static List<Products> data = [];

  Future<List<Products>> getProducts() async{
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var content = res.body;
      print(content.toString());
      var arr = json.decode(content)['food'] as List;

      // for every element of arr map to _fromJson
      // and convert the array to list

      // return arr.map((e) => _fromJson(e)).toList();
    }

    return <Products>[];
  }

  // Products _fromJson(Map<String, dynamic> item) {
  //   return new Products(
  //       description: item['description'],
  //       title: item['title'],
  //       image: item['image'],
  //       price: double.parse(item['price']), id: 0);
  //
  // }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static String? validatePassword(String value){
    if(value.isEmpty){
      return 'Please enter password';
    }
    if(value.length < 8){
      return 'Password should be more than 8 characters ';
    }
    return null;
  }

  static String? conformPassword(String value, String value2){
    if(!equalsIgnoreCase(value, value2))
      return "Conform password invalid";
    return null;
  }

  List<Products> getProductFromCate(int id) {
    return Products.init().where((p) => p.cateID == id).toList();
  }
}
