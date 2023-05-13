// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_delivery_app_clean_architecture/presentation/theme.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.padding,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: deliveryGradients,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
