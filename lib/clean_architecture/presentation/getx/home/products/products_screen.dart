import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/cart/cart_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/home/home_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/delivery_button.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  // final controller = Get.put<ProductsController>(
  //   ProductsController(
  //     apiRepositoryInterface: Get.find(),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Inicio'),
        ),
        //titleTextStyle: Theme.of(context).appBarTheme.textTheme?.headline6,
      ),
      body: Obx(
        () => controller.productList.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  final product = controller.productList[index];
                  return _ItemProducts(
                    product: product,
                    onTap: () {
                      cartController.add(product);
                    },
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class _ItemProducts extends StatelessWidget {
  _ItemProducts({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);
  final Products product;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      product.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(product.name.toString()),
                  const SizedBox(height: 10),
                  Text(product.description.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          ?.copyWith(color: DeliveryColors.lightGrey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${product.price} USD',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              onTap: onTap,
              text: 'Add',
              padding: const EdgeInsets.symmetric(vertical: 5),
            )
          ],
        ),
      ),
    );
  }
}
