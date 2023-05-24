import 'dart:async';
import 'package:flutter_delivery_app_clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_password = 'PASSWORD';
const _pref_image = 'IMAGE';
const _pref_dark_theme = 'THEME_DARK';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  Future<SharedPreferences> _sharedPreference = SharedPreferences.getInstance();
  @override
  Future<void> clearAllData() async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.clear();
  }

  @override
  Future<String?> getToken() async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    return sharedPreference.getString(_pref_token);
  }

  @override
  Future<String?> saveToken(String token) async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setString(_pref_token, token);

    return token;
  }

  @override
  Future<User> getUser() async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    final username = sharedPreference.getString(_pref_username);
    final name = sharedPreference.getString(_pref_name);
    final image = sharedPreference.getString(_pref_image);

    final user = User(
        name: name.toString(),
        username: username.toString(),
        image: image.toString());
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setString(_pref_username, user.username);
    sharedPreference.setString(_pref_name, user.name);
    sharedPreference.setString(_pref_image, user.image);

    return user;
  }

  @override
  Future<bool?> isDarkMode() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getBool(_pref_dark_theme);
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setBool(_pref_dark_theme, darkMode);
  }
}
