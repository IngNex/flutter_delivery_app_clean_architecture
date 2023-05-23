import 'package:flutter_delivery_app_clean_architecture/presentation/home/home_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/login/login_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomeScreen(),
    ),
  ];
}
