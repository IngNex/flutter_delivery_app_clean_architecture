import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/main_clean_architecture.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          // apiKey: "AIzaSyC03mKtF66oT_NkdP1Q1JFI3QJOjvyiaLw",
          // authDomain: "flutter-tesis-8cd59.firebaseapp.com",
          // projectId: "flutter-tesis-8cd59",
          // storageBucket: "flutter-tesis-8cd59.appspot.com",
          // messagingSenderId: "104521800186",
          // appId: "1:104521800186:web:50609666d8af2520842c43"
          apiKey: "AIzaSyADEUWyd7TcXIWcSEgbGkMr5gq1qQr09U8",
          authDomain: "prueba-api-7bcb0.firebaseapp.com",
          projectId: "prueba-api-7bcb0",
          storageBucket: "prueba-api-7bcb0.appspot.com",
          messagingSenderId: "674431584274",
          appId: "1:674431584274:web:ff03e236fda7736b01b0cb"
          // Your web Firebase config options
          ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
  // await AuthStore.read().then((value) {
  //   runApp(MyApp(user: value));
  // });
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
