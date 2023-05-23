import 'package:flutter_delivery_app_clean_architecture/presentation/splash/spash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    print('SplashBinding');
    Get.lazyPut(
      () => SplashController(
          localRepositoryInterface: Get.find(),
          apiRepositoryInterface: Get.find()),
    );
  }
}
