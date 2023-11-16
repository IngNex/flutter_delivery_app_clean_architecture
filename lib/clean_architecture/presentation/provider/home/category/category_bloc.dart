import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/category_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';

class CategoryBloc extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  CategoryBloc({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  List<Categorys> categoryList = <Categorys>[];
  

  void loadProducts() async {
    final token = await localRepositoryInterface.getToken();
    final result = await apiRepositoryInterface.getCategory(token!);
    categoryList = result;
    notifyListeners();
  }
}