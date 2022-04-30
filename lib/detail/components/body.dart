import 'package:flutter/material.dart';
import 'package:app_shopping/model/items.dart';
import 'package:app_shopping/model/products.dart';
import 'package:app_shopping/model/utilities.dart';
import 'package:quantity_input/quantity_input.dart';

import 'addtocart.dart';

class Body extends StatefulWidget {
  Products product;
  

  Body({Key? key, required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(widget.product.title, style: const TextStyle(fontSize: 30, color: Colors.red), textAlign: TextAlign.center,),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.asset(widget.product.image!)
          ),
          const SizedBox(height: 20,),
          Expanded(child: Text("Description: ${widget.product.description}" ), flex: 1,),
          QuantityInput(
            value: quantity,
            onChanged: (value) => setState(() => quantity = int.parse(value.replaceAll(',', ''))),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 20,
            child: Text("Price: ${widget.product.price.toStringAsFixed(3) + Utilities.getCurrency()}")
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Text("Category: ${widget.product.categoryId}")
          ),
          AddProductToCart(items: Items(products: widget.product, quantity: quantity),)
        ],
      ),
    );
  }
}
