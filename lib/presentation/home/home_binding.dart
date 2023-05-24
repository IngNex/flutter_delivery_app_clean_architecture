import 'package:flutter_delivery_app_clean_architecture/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
          localRepositoryInterface: Get.find(),
          apiRepositoryInterface: Get.find()),
    );
  }
}
