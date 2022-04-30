import 'package:app_shopping/model/items.dart';

import 'products.dart';

class Cart {
  static List<Items> cart = [];
  void addProductToCart(Items item){
    cart.add(item);
  }

  List<Items> getCart(){
    return cart;
  }
}