import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/cart/cart_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/cart/cart_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/home/home_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/home/products/products_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/home/profile/profile_screen.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.indexSelected.value,
                children: [
                  ProductsScreen(),
                  Placeholder(),
                  CartScreen(
                    onShopping: (() {
                      /*setState(() {
                      currentIndex = 0;
                    });*/
                      controller.indexSelected.value = 0;
                    }),
                  ),
                  Placeholder(),
                  ProfileScreen(),
                ],
              ),
            ),
          ),
          Obx(
            () => _DeliveryNavigationBar(
              index: controller.indexSelected.value,
              onIndexSelected: (index) {
                controller.updateIndexSelected(index);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  _DeliveryNavigationBar(
      {super.key, required this.index, required this.onIndexSelected});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).canvasColor,
            border: Border.all(color: Theme.of(context).bottomAppBarColor)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(0),
                  icon: Icon(Icons.home),
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(1),
                  icon: Icon(Icons.store),
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: DeliveryColors.purple,
                      radius: 23,
                      child: IconButton(
                        onPressed: () => onIndexSelected(2),
                        icon: Icon(Icons.shopping_basket),
                        color: index == 2
                            ? DeliveryColors.green
                            : DeliveryColors.white,
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: Obx(
                          () => cartController.totalItems.value == 0
                              ? const SizedBox.shrink()
                              : CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.pinkAccent,
                                  child: Text(cartController.totalItems.value
                                      .toString()),
                                ),
                        ))
                  ],
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(3),
                  icon: Icon(Icons.favorite_border),
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () => onIndexSelected(4),
                  child: Obx(
                    () {
                      final user = controller.user.value;
                      return user.image.isEmpty
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(user.image),
                            );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
