import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';

class ProductsBloc extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  ProductsBloc({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  List<Products> productList = <Products>[];
  

  void loadProducts() async {
    final token = await localRepositoryInterface.getToken();
    final result = await apiRepositoryInterface.getProducts(token!);
    productList = result;
    notifyListeners();
  }
}
