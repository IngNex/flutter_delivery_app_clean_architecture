import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/common/utils/http_helper.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:http/http.dart';

class ProductDataSource extends HttpHelper {
  ProductDataSource({apiUrl = 'products'}) : super(apiUrl);

   Future<List<Products>> getProducts() async {
    String url = '';
    final Response? result = await this.get(url);

    if (result == null || result.statusCode != HttpStatus.ok) {
      throw ErrorDescription('Hubo un error');
    }

    final jsonReponse = json.decode(result.body);
    List<Products> products =
        jsonReponse.map<Products>((e) => Products.fromJson(e)).toList();

    return products;
  }
}
