import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/splash/splash_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';

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
      home: SplashScreen(),
    );
  }
}
