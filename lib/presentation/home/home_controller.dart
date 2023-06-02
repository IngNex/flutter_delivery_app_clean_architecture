import 'package:flutter_delivery_app_clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.apiRepositoryInterface,
    required this.localRepositoryInterface,
  });
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;
  Rx<bool> darkTheme = false.obs;

  /* Products */
  RxList<Products> productList = <Products>[].obs;

  @override
  void onReady() {
    loadUser();
    loadProducts();
    loadCurrentTheme();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then(
          (value) => {
            user(value),
          },
        );
  }

  void loadCurrentTheme() {
    localRepositoryInterface.isDarkMode().then((value) => darkTheme(value));
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  // Bottom LogOut
  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token.toString());
    await localRepositoryInterface.clearAllData();
  }

  /*===================  Product Controller ====================*/
  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList.value = result;
  }
}
