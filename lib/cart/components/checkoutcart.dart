import 'package:flutter/material.dart';
import 'package:app_shopping/model/utilities.dart';

class CheckOutCart extends StatelessWidget {
  String sum;
  CheckOutCart({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Expanded(
          child: FlatButton(
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            color: Colors.white,
            textColor: Colors.green,
            onPressed: () {},
            child: Text(
              "${sum + Utilities.getCurrency()}",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),

        Expanded(child: FlatButton(
          height: 50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: Colors.green)),
          onPressed: () {},
          color: Colors.green,
          textColor: Colors.white,
          child: Text("Check out".toUpperCase(),
              style: TextStyle(fontSize: 14)),
        ),)
      ],
    );
  }
}