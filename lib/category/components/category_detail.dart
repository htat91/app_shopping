import 'package:app_shopping/services/api_service.dart';
import 'package:flutter/material.dart';

import '../../model/products.dart';
import '../../model/utilities.dart';

class CategoryDetail extends StatefulWidget {
  int id;
  CategoryDetail(this.id, {Key? key}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  List<Products>? products;
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
    var item = await APIService.getAllProduct();
    if (item != null)  {     
      setState(() {
        isLoading = false;
        products = item;
      });
    } else {
      setState(() {
        isLoading = false;
        products = [];
      });
    }
  }

  // List<Products> getProductFromCate(int id) {
  //   return products!.where((p) => p.categoryId == id).toList();
  // }

  @override
  Widget build(BuildContext context) {
    if (products == null || isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return buildListView(products!.where((p) => p.categoryId == widget.id).toList());
  }
  ListView buildListView(List<Products> data) {
  print(data.toString());
  return ListView.builder( 
    itemCount: data.length,
    itemBuilder: (context, index){
      return ListTile(
        // leading: data[index].id != null ? Image.network('${Utilities.host}${data[index].image}'),
        leading: Image.asset(data[index].image!),
        title: Text(data[index].title),
        trailing: Text(data[index].price.toString()),
        onTap: () {
          // Navigator.pushNamed(context, ProductPage.routeName, arguments: ProductDetailsArguments(product: data[index]));
        });
    },
  );
}
}