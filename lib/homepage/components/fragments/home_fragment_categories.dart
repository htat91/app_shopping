import 'dart:convert';
import 'package:app_shopping/config.dart';
import 'package:app_shopping/model/categories.dart';
import 'package:app_shopping/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/strings.dart';

import '../../../category/categorypage.dart';



class CategoriesStore extends StatefulWidget {
  const CategoriesStore({Key? key}) : super(key: key);
  @override
  _CategoriesStore createState() => _CategoriesStore();
}

class _CategoriesStore extends State<CategoriesStore> {
  List<Categories>? categories;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {    
    setState(() {
      isLoading = true;
    });
    var item = await APIService.getAllCategory();
    if (item != null)  {     
      setState(() {
        categories = item;
        isLoading = false;
      });
    } else {
      setState(() {
        categories = [];
        isLoading = false;
      });
    }
  }

  Widget getCate(index) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(5),
      child: Image.asset(categories![index].imageCate!),
    );
  }

  Widget getBody() {
    if (categories == null || isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories!.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, CategoryPage.routeName, arguments: categories![index].id);
                      },
                      child: getCate(index)
                    );
                    // return getCate(index);
                  });
  }
  @override
  Widget build(BuildContext context) {
    // final categories =  Categories.init();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,

        child: Column(
          children: [
            Row(
              children: const [
                Expanded(child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),)),
                Text('See more',style: TextStyle(fontSize: 16, color: Colors.lightGreen),),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: getBody(),
            )
          ],
        ),
      ),
    );
  }
}

// class CategoriesItem extends StatelessWidget {
//   Categories category;


//   CategoriesItem({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 150,
//       padding: EdgeInsets.all(5),
//       child: Image.asset(category.image),
//     );
//   }
// }


