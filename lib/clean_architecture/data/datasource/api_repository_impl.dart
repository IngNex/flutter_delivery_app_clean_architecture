import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/common/utils/auth_store.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/api/category_api.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/api/products_api.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/api/user_api.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/exception/auth_exception.dart';

import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/request/login_request.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/response/login_response.dart';

import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/category_modal.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<People> getUserFromToken(String token, String id) async {
    await Future.delayed(const Duration(seconds: 3));
    //print(token);

    // String finalUrl =
    //     "https://securetoken.googleapis.com/v1/token?key=AIzaSyADEUWyd7TcXIWcSEgbGkMr5gq1qQr09U8";

    // Map<String, dynamic> formMap = {
    //   "grant_type": "refresh_token",
    //   "refresh_token":
    //       "AMf-vBxuh_W1lCaaxQsgcetAEZ9WByNOMgIYxfUj205_fibUmv25At3iQGmd3UY7qE8j2a7_GJDlimDsqNt1plg8PbouTr9A98rUSLZASW2WQcyDulCVrb5yUINrUYJEsNNGYRXjTFtJPPPXuruqCTs0E7e8PPzx0gHHjM4GMsDHGhVVBUtDxmQYVScsPYuz69CGnecnyYp3z8Q7pd_AwWoEq_sIk8c1DA",
    // };

    // Response result = await http.post(
    //   Uri.parse(
    //       "https://securetoken.googleapis.com/v1/token?key=AIzaSyADEUWyd7TcXIWcSEgbGkMr5gq1qQr09U8"),
    //   body: {
    //     'grant_type': 'refresh_token',
    //     'refresh_token':
    //         'AMf-vBzhZS-wDXq_I-gO6ylpW-zXra-bj5uWeiGyvWgbY2ILSqu3QYxGSF6J53BV-ALfPpRjlA7XwlsWyY3PjUL7NrVMIhKYfhQYEjh2Y0aTx4VmfMQWMf_qWSeAUUkpiR9phGRBUYvMYZp9-U-EfQ9J371bDBw0K0J1IS_eo4R9P5QqT0V4e9QARIzY7KHe11qz7mbpXYFLvm8rmG5_p8giV_9xB6gskQ'
    //   },
    //   headers: {
    //     "Content-Type": "application/x-www-form-urlencoded",
    //   },
    // );

    // final jsonReponse = convert.json.decode(result.body);

    // print(jsonReponse.toString());

    // id = jsonReponse['user_id'].toString();
    // final String bearer = jsonReponse['id_token'].toString();

    // AuthStore.save(bearer);

    return await UserDataSource().getUserId(id);

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await Future.delayed(const Duration(seconds: 3));

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: login.username, password: login.password);
      
      final bearer = await FirebaseAuth.instance.currentUser!.getIdTokenResult(true);
      //print(bearer2.token);
      final id = credential.user!.uid;
      //final bearer = await FirebaseAuth.instance.currentUser!.getIdToken();

      AuthStore.save(bearer.token.toString());

      return LoginResponse(
        id: credential.user!.uid,
        token: bearer.token.toString(),
        user: await UserDataSource().getUserId(id),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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
