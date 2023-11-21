import 'package:flutter/foundation.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/common/utils/auth_store.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/api/category_api.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/api/products_api.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/exception/auth_exception.dart';

import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/request/login_request.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/response/login_response.dart';

import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/category_modal.dart';

import 'package:firebase_auth/firebase_auth.dart';


class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<People> getUserFromToken(String token, String id) async {
    await Future.delayed(const Duration(seconds: 3));
    print(id);
    return People(
      name: 'Michael Rodriguez',
      username: 'ingnex',
      image: 'assets/images/ingnex.png',
    );

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await Future.delayed(const Duration(seconds: 3));

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: login.username, password: login.password);
      //return credential.user;
      //print(credential.user!.email);
      print(credential.user!.uid);
      final bearer = await FirebaseAuth.instance.currentUser!.getIdToken();
      
      AuthStore.save(bearer.toString());

      return LoginResponse(
        id: credential.user!.uid,
        token: bearer.toString(),
        user: People(
          name: credential.user!.email.toString(),
          username: 'credential.user',
          image: 'assets/images/ingnex.png',
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      // if (e.code == 'email-already-in-use') {
      //   showToast(message: 'The email address is already in use.');
      // } else {
      //   showToast(message: 'An error occurred: ${e.code}');
      // }
    }

    // if (login.username == 'ingnex' && login.password == 'nex') {
    //   return LoginResponse(
    //     token: 'AA111',
    //     user: People(
    //       name: 'Michael Rodriguez',
    //       username: 'ingnex',
    //       image: 'assets/images/ingnex.png',
    //     ),
    //   );
    // } else if (login.username == 'nexus' && login.password == 'nexus') {
    //   return LoginResponse(
    //     token: 'AA222',
    //     user: People(
    //       name: 'Rogger Martinez',
    //       username: 'nexus',
    //       image: 'assets/icons/ingnex.png',
    //     ),
    //   );
    // }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    AuthStore.remove();
    print('removing token from server $token');
    return;
  }

  @override
  Future<List<Products>> getProducts(String token) async {
    await Future.delayed(const Duration(seconds: 1));
    return await ProductDataSource().getProducts();
  }

  @override
  Future<List<Categorys>> getCategory(String token) async {
    await Future.delayed(const Duration(seconds: 1));
    return await CategoryDataSource().getCategory();
  }
}
