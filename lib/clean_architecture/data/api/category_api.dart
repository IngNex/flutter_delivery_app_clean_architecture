import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/common/utils/http_helper.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/category_modal.dart';
import 'package:http/http.dart';

class CategoryDataSource extends HttpHelper {
  CategoryDataSource({apiUrl = 'category'}) : super(apiUrl);

   Future<List<Categorys>> getCategory() async {
    String url = '';
    final Response? result = await this.get(url);

    if (result == null || result.statusCode != HttpStatus.ok) {
      throw ErrorDescription('Hubo un error');
    }

    final jsonReponse = json.decode(result.body);
    List<Categorys> categorys =
        jsonReponse.map<Categorys>((e) => Categorys.fromJson(e)).toList();

    return categorys;
  }
}
