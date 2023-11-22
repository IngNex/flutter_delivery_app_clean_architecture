import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/product_card_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';

class CartBloc extends ChangeNotifier {
  List<ProductCart> cartList = <ProductCart>[];
  int totalItems = 0;
  double totalPrice = 0.0;

  void add(Products products) {
    final temp = List<ProductCart>.from(cartList);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == products.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: products));
    }

    cartList = List<ProductCart>.from(temp);

    calculateTotals(temp);
  }

  void increment(ProductCart productsCart) {
    productsCart.quantity += 1;
    cartList = List<ProductCart>.from(cartList);
    calculateTotals(cartList);
  }

  void decrement(ProductCart productsCart) {
    if (productsCart.quantity > 1) {
      productsCart.quantity -= 1;
      cartList = List<ProductCart>.from(cartList);
      calculateTotals(cartList);
    }
  }

  void calculateTotals(List<ProductCart> temp) {
    final total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    totalItems = total;

    final totalCost = temp.fold(
        0.0,
        (previousValue, element) =>
            (element.quantity * double.parse(element.product.price.toString())) + previousValue);
    totalPrice = totalCost;

    temp.forEach((element) { print("${element.product.name} ${element.quantity} ${double.parse(element.product.price.toString())*element.quantity}");});
    notifyListeners();
  }

  void deleteProduct(ProductCart productsCart) {
    cartList.remove(productsCart);
    calculateTotals(cartList);
  }
}
