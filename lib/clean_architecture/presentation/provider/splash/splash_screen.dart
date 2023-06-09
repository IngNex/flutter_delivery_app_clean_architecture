import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/api_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/home/home_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/login/login_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/provider/splash/splash_bloc.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloc(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    final bloc = context.read<SplashBloc>();
    final result = await bloc.validateSession();
    if (result) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 65,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/images/ingnex.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "IngNexApp",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold, color: DeliveryColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
