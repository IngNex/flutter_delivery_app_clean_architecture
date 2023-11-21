import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
  Future<String?> saveToken(String token);
  Future<String?> getIdUser();
  Future<String?> saveIdUser(String id);
  Future<void> clearAllData();
  Future<People> saveUser(People user);
  Future<People> getUser();
  Future<void> saveDarkMode(bool darkMode);
  Future<bool?> isDarkMode();
}
