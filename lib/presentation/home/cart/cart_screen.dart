// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
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
        titleTextStyle: Theme.of(context).appBarTheme.textTheme?.headline6,
      ),
      body: _EmptyCart(onShopping: onShopping),
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
          style: TextStyle(color: Theme.of(context).accentColor),
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
