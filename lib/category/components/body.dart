import 'package:flutter/material.dart';

import 'category_detail.dart';

class Body extends StatelessWidget {
  int? cateId;
  Body(this.cateId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CategoryDetail(cateId!));
  }
  
}