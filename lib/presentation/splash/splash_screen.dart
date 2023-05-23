import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/splash/spash_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();

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
