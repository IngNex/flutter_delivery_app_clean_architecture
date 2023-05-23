import 'package:flutter_delivery_app_clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/request/login_request.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
}
