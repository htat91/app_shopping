import 'package:app_shopping/model/products.dart';
import 'package:app_shopping/model/utilities.dart';
import 'package:app_shopping/services/api_service.dart';
import 'package:app_shopping/services/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ProductPopular extends StatefulWidget {
  @override
  _ProductPopular createState() => _ProductPopular();
}

class _ProductPopular extends State<ProductPopular> {
  // List<Products>? products;
  // bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // fetchData() async {    
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var item = await APIService.getAllProduct();
  //   if (item != null)  {     
  //     setState(() {
  //       products = item;
  //       isLoading = false;
  //     });
  //   } else {
  //     setState(() {
  //       products = [];
  //       isLoading = false;
  //     });
  //   }
  // }

  // Widget getBody() {
  //   if (products == null || isLoading) {
  //     return const Center(child: CircularProgressIndicator());
  //   }
  //   return GridView.builder(
  //                 scrollDirection: Axis.vertical,
  //                 shrinkWrap: true,
  //                 primary: false,
  //                 itemCount: products!.length,
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                     crossAxisCount: 3,
  //                     mainAxisSpacing: 10,
  //                     crossAxisSpacing: 10,
  //                     childAspectRatio: 0.7

  //                 ),
  //                 itemBuilder: (context, index) {
  //                   return ProductItem(
  //                     product: products![index],
  //                   );
  //                 });
  // }

  @override
  Widget build(BuildContext context) {
    // var productsAPI = Utilities().getProducts();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Expanded(child: Text('Popular Products ', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),)),
              Text('See more',
                style: TextStyle(fontSize: 16, color: Colors.lightGreen),),
            ],
          ),
          SizedBox(height: 10,),
          Container(
              child: GetBodyProduct(),
          ),

        ],
      ),
    );

  }
}

class ProductItem extends StatelessWidget {
  Products product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    if(product.image != null){

    }
    return GestureDetector(
      onTap: () {
        // print(product.id.toString());
        if(!Utilities.dataCheck.contains(product.id)){
          Utilities.data.add(product);
          Utilities.dataCheck.add(product.id);
        }
        // Navigator.pushNamed(context, ProductPage.routeName,
        // arguments: ProductDetailsArguments(product: product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset(product.image!, fit: BoxFit.fill,),
          Row(
            children: [
              Expanded(child: Text(product.title)),
              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.green
                  ),
                  child: Text(product.price.toString(), style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),)),
            ],
          )
        ],
      ),
    );
  }
}

class GetBodyProduct extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Products>?> products = ref.watch(productStateFuture);
    return products.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('${err.toString()}')),
      data: (products) {
        return GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              product: products[index],
            );
          });
      }
    );
  }

}
