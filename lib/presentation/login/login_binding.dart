import 'package:flutter_delivery_app_clean_architecture/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
          localRepositoryInterface: Get.find(),
          apiRepositoryInterface: Get.find()),
    );
  }
}
