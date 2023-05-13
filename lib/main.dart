import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/splash/splash_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _borderLight = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: DeliveryColors.grey,
        width: 1,
        style: BorderStyle.solid,
      ),
    );

    final _borderDark = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: DeliveryColors.veryLightGrey,
        width: 1,
        style: BorderStyle.solid,
      ),
    );

    final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: DeliveryColors.white,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
              fontSize: 20,
              color: DeliveryColors.purple,
              fontWeight: FontWeight.bold),
        ),
      ),
      canvasColor: DeliveryColors.white,
      scaffoldBackgroundColor: DeliveryColors.white,
      bottomAppBarColor: DeliveryColors.veryLightGrey,
      accentColor: DeliveryColors.purple,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.purple,
        displayColor: DeliveryColors.purple,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _borderLight,
        enabledBorder: _borderLight,
        focusedBorder: _borderLight,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: DeliveryColors.purple),
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.lightGrey,
          fontSize: 10,
        ),
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.purple,
      ),
      // cardTheme: CardTheme(
      //   color: DeliveryColors.white,
      // ),
    );

    final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: DeliveryColors.purple,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
              fontSize: 20,
              color: DeliveryColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      canvasColor: DeliveryColors.grey,
      scaffoldBackgroundColor: DeliveryColors.dark,
      bottomAppBarColor: DeliveryColors.dark,
      accentColor: DeliveryColors.white,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.green,
        displayColor: DeliveryColors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: DeliveryColors.white),
        fillColor: DeliveryColors.grey,
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.white,
          fontSize: 10,
        ),
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.white,
      ),
      // cardTheme: CardTheme(
      //   color: DeliveryColors.grey,
      // ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: SplashScreen(),
    );
  }
}
