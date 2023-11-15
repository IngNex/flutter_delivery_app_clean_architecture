import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:get/get.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';

class ProductsController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  ProductsController({
    required this.apiRepositoryInterface,
  });

  RxList<Products> productList = <Products>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts('token');
    productList.value = result;
  }
}
