import 'package:flutter/material.dart';
import '../homepage/homepage.dart';
import 'components/body.dart';

class CategoryPage extends StatelessWidget {
  static String routeName = "/categoryDetail";
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Category Details"),
      ),
      body: Body(ModalRoute.of(context)!.settings.arguments as int));
  }
}