
import 'package:app_shopping/model/categories.dart';
import 'package:app_shopping/model/products.dart';
import 'package:app_shopping/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productStateFuture = FutureProvider<List<Products>?>((ref) async {
  return APIService.getAllProduct();
});

final categoryStateFuture = FutureProvider<List<Categories>?>((ref) async {
  return APIService.getAllCategory();
});