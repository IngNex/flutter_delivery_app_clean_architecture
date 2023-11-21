import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/user_modal.dart';

class LoginResponse {
  final String id;
  final String token;
  final People user;
  const LoginResponse({
    required this.id,
    required this.token,
    required this.user,
  });
}
