import 'package:flutter_delivery_app_clean_architecture/presentation/home/home_binding.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/home/home_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/login/login_binding.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/login/login_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/main_binding.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/splash/splash_binding.dart';
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
      // Inyecta
      bindings: [MainBinding(), SplashBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => LoginScreen(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
