import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/products/in_memory_products_data.dart';
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

import 'dart:io';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<People> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
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
      final bearer = await FirebaseAuth.instance.currentUser!.getIdToken();
      print(bearer);
      return LoginResponse(
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
    print('removing token from server $token');
    return;
  }

  @override
  Future<List<Products>> getProducts(String token) async {
    await Future.delayed(const Duration(seconds: 1));
    final String baseUrl =
        'https://us-central1-prueba-api-7bcb0.cloudfunctions.net/app/api/v1/';

    Future<Map<String, String>> headers() async {
      return {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      };
    }

    Future<Response?> get(String? url) async {
      String apiUrl = 'products';
      final String fullUrl = baseUrl + apiUrl + url!;
      Response result =
          await http.get(Uri.parse(fullUrl), headers: await headers());

      return result.statusCode == HttpStatus.unauthorized ? null : result;
    }

    String url = '';
    final Response? result = await get(url);
    print(result!.body);
    final jsonReponse = json.decode(result.body);
    List<Products> products =
        jsonReponse.map<Products>((e) => Products.fromJson(e)).toList();

    //http://localhost:5000/prueba-api-7bcb0/us-central1/app/api/v1/products
    return products;
  }

  @override
  Future<List<Categorys>> getCategory(String token) async {
    await Future.delayed(const Duration(seconds: 1));
    final String baseUrl =
        'https://us-central1-prueba-api-7bcb0.cloudfunctions.net/app/api/v1/';

    Future<Map<String, String>> headers() async {
      return {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      };
    }

    Future<Response?> get(String? url) async {
      String apiUrl = 'category';
      final String fullUrl = baseUrl + apiUrl + url!;
      Response result =
          await http.get(Uri.parse(fullUrl), headers: await headers());

      return result.statusCode == HttpStatus.unauthorized ? null : result;
    }

    String url = '';
    final Response? result = await get(url);
    print(result!.body);
    final jsonReponse = json.decode(result.body);
    List<Categorys> categorys =
        jsonReponse.map<Categorys>((e) => Categorys.fromJson(e)).toList();

    //http://localhost:5000/prueba-api-7bcb0/us-central1/app/api/v1/products
    return categorys;
  }
}
