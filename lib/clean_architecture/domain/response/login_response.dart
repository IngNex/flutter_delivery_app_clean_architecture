import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';

class LoginResponse {
  final String token;
  final People user;
  const LoginResponse({
    required this.token,
    required this.user,
  });
}
