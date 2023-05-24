import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/main_binding.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/routes/delivery_navigation.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
