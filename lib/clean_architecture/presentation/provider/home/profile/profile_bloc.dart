import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';

class ProfileBloc extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  ProfileBloc({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  bool isDark = false;

  void loadTheme() async {
    isDark = await localRepositoryInterface.isDarkMode() ?? false;
    notifyListeners();
  }

  void updateTheme(bool isDarkValue) {
    localRepositoryInterface.saveDarkMode(isDarkValue);
    isDark = isDarkValue;
    notifyListeners();
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token!);
    await localRepositoryInterface.clearAllData();
  }
}
