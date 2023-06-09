import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/main_clean_architecture.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/main_binding.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/routes/delivery_navigation.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: MainCleanArchitecture(),
    );
  }
}
