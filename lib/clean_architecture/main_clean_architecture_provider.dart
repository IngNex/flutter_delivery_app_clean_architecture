import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/datasource/api_repository_impl.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/data/datasource/local_repository_impl.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(
          create: (_) => ApiRepositoryImpl(),
        ),
        Provider<LocalRepositoryInterface>(
          create: (_) => LocalRepositoryImpl(),
        ),
      ],
      child: Builder(
        builder: (newContext) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            home: SplashScreen.init(newContext),
          );
        },
      ),
    );
  }
}
