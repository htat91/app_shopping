import 'package:app_shopping/model/carts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app_shopping/model/items.dart';

import '../../model/products.dart';

class AddProductToCart extends StatefulWidget {
  Items items;
  AddProductToCart({required this.items});

  @override
  _AddProductToCartState createState() => _AddProductToCartState();
}

class _AddProductToCartState extends State<AddProductToCart> {

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () {
            if(widget.items.quantity == 0){
              Fluttertoast.showToast(
                msg: "Số lượng không thể bằng 0",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
              );
            } else {
                Cart cart = Cart();
                cart.addProductToCart(widget.items);
                print(cart.getCart().length.toString());
                Fluttertoast.showToast(
                    msg: "Add to cart",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
            }           
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.green,
        child: Text("Add to cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),),
    );
  }
}
