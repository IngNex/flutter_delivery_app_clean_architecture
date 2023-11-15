import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/request/login_request.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<People> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Products>> getProducts(String token);
}
