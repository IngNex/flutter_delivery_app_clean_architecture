import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/cart/cart_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localRepositoryInterface: Get.find(),
        apiRepositoryInterface: Get.find(),
      ),
    );

    Get.lazyPut(
      () => CartController(),
    );
  }
}
