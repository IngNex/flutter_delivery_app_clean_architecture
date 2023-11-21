import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStore {
  static final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  static void save(String token) async {
    final value = token;
    await _storage.write(key: 'auth', value: value);
  }

  static Future<String?> read() async {
    final auth = await _storage.read(key: 'auth');
    return auth;
  }

  static void remove() async {
    await _storage.delete(key: 'auth');
  }
}

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);
