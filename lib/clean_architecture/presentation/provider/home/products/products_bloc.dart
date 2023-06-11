import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';

class ProductsBloc extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;
  ProductsBloc({
    required this.apiRepositoryInterface,
  });

  List<Products> productList = <Products>[];

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList = result;
    notifyListeners();
  }
}
