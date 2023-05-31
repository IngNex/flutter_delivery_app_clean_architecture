import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/home/home_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/routes/delivery_navigation.dart';
import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.find<HomeController>();
  Future<void> logout() async {
    await controller.logOut();
    Get.offAllNamed(DeliveryRoutes.splash);
    Get.changeThemeMode(ThemeMode.light);
  }

  void onThemeUpdated(bool isDark) {
    controller.updateTheme(isDark);
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user.value;
      return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Profile'),
            ),
            //titleTextStyle: Theme.of(context).appBarTheme.textTheme?.headline6,
          ),
          body: user.image.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: DeliveryColors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                radius: 60,
                                child: Image.asset(user.image),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Theme.of(context).canvasColor,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Personal Information',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Correo:',
                                      style: TextStyle(
                                          color: DeliveryColors.green),
                                    ),
                                    Text(
                                      user.username,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Darkt Theme',
                                        ),
                                        Spacer(),
                                        Obx(
                                          () => Switch(
                                            value: controller.darkTheme.value,
                                            onChanged: onThemeUpdated,
                                            activeColor: DeliveryColors.green,
                                            inactiveThumbColor:
                                                DeliveryColors.purple,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: logout,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DeliveryColors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(color: DeliveryColors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink());
    });
  }
}
