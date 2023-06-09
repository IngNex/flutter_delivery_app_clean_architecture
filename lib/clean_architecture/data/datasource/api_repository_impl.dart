import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/products/in_memory_products_data.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/exception/auth_exception.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/request/login_request.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/response/login_response.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
        name: 'Michael Rodriguez',
        username: 'ingnex',
        image: 'assets/images/ingnex.png',
      );
    } else if (token == 'AA222') {
      return User(
        name: 'Rogger Martinez',
        username: 'nexus',
        image: 'assets/icons/ingnex.png',
      );
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'ingnex' && login.password == 'nex') {
      return LoginResponse(
        token: 'AA111',
        user: User(
          name: 'Michael Rodriguez',
          username: 'ingnex',
          image: 'assets/images/ingnex.png',
        ),
      );
    } else if (login.username == 'nexus' && login.password == 'nexus') {
      return LoginResponse(
        token: 'AA222',
        user: User(
          name: 'Rogger Martinez',
          username: 'nexus',
          image: 'assets/icons/ingnex.png',
        ),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server $token');
    return;
  }

  @override
  Future<List<Products>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
