import 'package:flutter_delivery_app_clean_architecture/domain/model/user_modal.dart';

class LoginResponse {
  final String token;
  final User user;
  LoginResponse({
    required this.token,
    required this.user,
  });
}
