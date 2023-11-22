import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/common/utils/http_helper.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';
import 'package:http/http.dart';

class UserDataSource extends HttpHelper {
  UserDataSource({apiUrl = 'users'}) : super(apiUrl);

  Future<People> getUserId(String id) async {
    String url = '/$id';
    final Response? result = await this.get(url);

    if (result == null || result.statusCode != HttpStatus.ok) {
      throw ErrorDescription('Hubo un error');
    }

    final jsonReponse = json.decode(result.body);
    People user = People(
        name: jsonReponse['name'],
        username: jsonReponse['username'],
        image: jsonReponse['img']);

    return user;
  }
}
