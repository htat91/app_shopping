import 'dart:io';

import 'package:app_shopping/model/carts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_shopping/cart/components/checkoutcart.dart';
import 'package:app_shopping/model/items.dart';
import '../../model/products.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Items> cartdetails = Cart().getCart();
  double sum =0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((item) { sum = sum + item.products!.price * item.quantity!; });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartdetails.length,
              itemBuilder: (context, index)  {
              return Column(
                children: [
                  GestureDetector(
                      child: CartItem(item: cartdetails[index],),
                    onTap: (){
                        setState(() {
                          cartdetails.removeAt(index);
                          sum = 0.0;
                          cartdetails.forEach((item) { sum = sum + item.products!.price * item.quantity!; });
                        });
                    },
                  ),
                  Divider()
                ],
              ) ;
            }),
          ),
          CheckOutCart(sum: sum.toStringAsFixed(3),)
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Items item;

  CartItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
             height: 100,
              child: Image.asset(item.products!.image!)),
          Expanded(child: Text(item.products!.title)) ,
          Expanded(child: Text(item.products!.price.toStringAsFixed(3) + getCurrency())),
          Expanded(child: Text(item.quantity.toString())),
          Icon(Icons.delete_outlined)
        ]

      ),
    );
  }
}

String getCurrency() {
  Intl.defaultLocale = 'vi_VN';
  var format = NumberFormat.simpleCurrency(locale: Intl.defaultLocale);
  return format.currencySymbol;
}
