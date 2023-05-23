import 'package:flutter_delivery_app_clean_architecture/presentation/routes/delivery_navigation.dart';
import 'package:get/get.dart';

import 'package:flutter_delivery_app_clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/local_storage_repository.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
      print('SplashBinding 1');
    } else {
      Get.offNamed(DeliveryRoutes.login);
      print('SplashBinding 2');
    }
  }
}
