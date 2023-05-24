import 'package:flutter_delivery_app_clean_architecture/presentation/routes/delivery_navigation.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';
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
  void onInit() {
    validateTheme();
    super.onInit();
  }

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    if (isDark != null) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
    ;
  }

  void validateSession() async {
    await Future.delayed(const Duration(seconds: 3));
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      // Lo persisto
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
      print('SplashBinding 1');
    } else {
      Get.offNamed(DeliveryRoutes.login);
      print('SplashBinding 2');
    }
  }
}
