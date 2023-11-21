import 'dart:io';

import 'package:flutter_delivery_app_clean_architecture/clean_architecture/common/utils/auth_store.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpHelper {
  final String baseUrl = 'https://us-central1-prueba-api-7bcb0.cloudfunctions.net/app/api/v1/';
  final String? apiUrl;

  HttpHelper(this.apiUrl);

  Future<Map<String, String>> headers() async {
    final storeModel = await AuthStore.read();
    final token = storeModel ?? '';

    return {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };
  }

  Future<Response?> get(String? url) async {
    final String fullUrl = baseUrl + apiUrl! + url!;
    Response result =
        await http.get(Uri.parse(fullUrl), headers: await headers());

    return result.statusCode == HttpStatus.unauthorized ? null : result;
  }

  Future<Response?> post(String? url, data) async {
    final String finalUrl = baseUrl + apiUrl! + url!;

    // print('finalUrl: $finalUrl');
    // print('data: $data');

    Response result = await http.post(Uri.parse(finalUrl),
        body: data, headers: await headers());

    return result.statusCode == HttpStatus.unauthorized ? null : result;
  }

  Future<Response?> update(String? url, Object? data) async {
    final String finalUrl = baseUrl + apiUrl! + url!;

    Response result = await http.patch(Uri.parse(finalUrl),
        body: data, headers: await headers());

    return result.statusCode == HttpStatus.unauthorized ? null : result;
  }

  Future<Response?> delete(String? url) async {
    final String finalUrl = baseUrl + apiUrl! + url!;

    Response result =
        await http.delete(Uri.parse(finalUrl), headers: await headers());

    return result.statusCode == HttpStatus.unauthorized ? null : result;
  }
}
