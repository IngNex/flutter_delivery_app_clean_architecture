// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/product_card_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/getx/cart/cart_controller.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/theme.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/presentation/common/delivery_button.dart';

class CartScreen extends GetWidget<CartController> {
  CartScreen({
    Key? key,
    required this.onShopping,
  }) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Shopping Cart'),
        ),
        //titleTextStyle: Theme.of(context).appBarTheme.textTheme?.headline6,
      ),
      body: Obx(() => controller.totalItems.value == 0
          ? _EmptyCart(onShopping: onShopping)
          : _FullCart()),
    );
  }
}

class _FullCart extends GetWidget<CartController> {
  const _FullCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.cartList.length,
                  itemExtent: 230,
                  itemBuilder: ((context, index) {
                    final productCart = controller.cartList[index];
                    return _ShoppingCartProducts(
                        productCart: productCart,
                        onDelete: () {
                          controller.deleteProduct(productCart);
                        },
                        onIncrement: () {
                          controller.increment(productCart);
                        },
                        onDecrement: () {
                          controller.decrement(productCart);
                        });
                  }),
                ),
              )),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).canvasColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SubTotal',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            Text(
                              '0.0 USD',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Deivery',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            Text(
                              'Free',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                            Obx(() {
                              final total = controller.totalPrice.value
                                  .toStringAsFixed(2);
                              return Text(
                                '\$${total} USD',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  DeliveryButton(
                      onTap: () {},
                      text: 'Checkout',
                      padding: EdgeInsets.all(15))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoppingCartProducts extends StatelessWidget {
  const _ShoppingCartProducts({
    Key? key,
    required this.productCart,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);
  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final product = productCart.product;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name.toString()),
                        const SizedBox(height: 10),
                        Text(product.description.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(color: DeliveryColors.lightGrey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: onDecrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: DeliveryColors.white,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: DeliveryColors.purple,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(productCart.quantity.toString()),
                              ),
                              InkWell(
                                onTap: onIncrement,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: DeliveryColors.purple,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(color: DeliveryColors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(
                  Icons.delete,
                  color: DeliveryColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({
    Key? key,
    required this.onShopping,
  }) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/delivery/sad.png',
          color: DeliveryColors.green,
          height: 90,
        ),
        const SizedBox(height: 20),
        Text(
          'There are no products',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: onShopping,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Go Shopping',
                style: TextStyle(color: DeliveryColors.white),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: DeliveryColors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
