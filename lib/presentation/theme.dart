import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF56388);
}

final deliveryGradients = [
  DeliveryColors.green,
  DeliveryColors.purple,
];

// final _borderLight = OutlineInputBorder(
//   borderRadius: BorderRadius.circular(10),
//   borderSide: BorderSide(
//     color: DeliveryColors.grey,
//     width: 1,
//     style: BorderStyle.solid,
//   ),
// );

// final _borderDark = OutlineInputBorder(
//   borderRadius: BorderRadius.circular(10),
//   borderSide: BorderSide(
//     color: DeliveryColors.veryLightGrey,
//     width: 1,
//     style: BorderStyle.solid,
//   ),
// );

// final lightTheme = ThemeData(
//   canvasColor: DeliveryColors.white,
//   scaffoldBackgroundColor: DeliveryColors.white,
//   accentColor: DeliveryColors.purple,
//   textTheme: GoogleFonts.poppinsTextTheme().apply(
//     bodyColor: DeliveryColors.purple,
//     displayColor: DeliveryColors.purple,
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     border: _borderLight,
//     enabledBorder: _borderLight,
//     focusedBorder: _borderLight,
//     contentPadding: EdgeInsets.zero,
//     labelStyle: TextStyle(color: DeliveryColors.purple),
//     filled: true,
//     hintStyle: GoogleFonts.poppins(
//       color: DeliveryColors.lightGrey,
//       fontSize: 10,
//     ),
//   ),
//   iconTheme: IconThemeData(
//     color: DeliveryColors.purple,
//   ),
// );

// final darkTheme = ThemeData(
//   canvasColor: DeliveryColors.grey,
//   scaffoldBackgroundColor: DeliveryColors.dark,
//   accentColor: DeliveryColors.white,
//   textTheme: GoogleFonts.poppinsTextTheme().apply(
//     bodyColor: DeliveryColors.green,
//     displayColor: DeliveryColors.green,
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     border: _borderDark,
//     enabledBorder: _borderDark,
//     focusedBorder: _borderDark,
//     contentPadding: EdgeInsets.zero,
//     labelStyle: TextStyle(color: DeliveryColors.white),
//     fillColor: DeliveryColors.grey,
//     filled: true,
//     hintStyle: GoogleFonts.poppins(
//       color: DeliveryColors.white,
//       fontSize: 10,
//     ),
//   ),
//   iconTheme: IconThemeData(
//     color: DeliveryColors.white,
//   ),
// );
