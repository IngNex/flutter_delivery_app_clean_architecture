import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';

class SplashBloc extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashBloc({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  // void validateTheme() async {
  //   final isDark = await localRepositoryInterface.isDarkMode();
  //   if (isDark != null) {
  //     Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  //   } else {
  //     Get.changeThemeMode(Get.isDarkMode ? ThemeMode.dark : ThemeMode.light);
  //   }
  //   ;
  // }

  Future<bool> validateSession() async {
    await Future.delayed(const Duration(seconds: 3));
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      // Lo persisto
      await localRepositoryInterface.saveUser(user);
      return true;
    } else {
      return false;
    }
  }
}
