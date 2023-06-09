import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/product_card_model.dart';
import 'package:flutter_delivery_app_clean_architecture/clean_architecture/domain/model/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Products products) {
    final temp = List<ProductCart>.from(cartList.value);
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

    cartList.value = List<ProductCart>.from(temp);

    calculateTotals(temp);
  }

  void increment(ProductCart productsCart) {
    productsCart.quantity += 1;
    cartList.value = List<ProductCart>.from(cartList.value);
    calculateTotals(cartList.value);
  }

  void decrement(ProductCart productsCart) {
    if (productsCart.quantity > 1) {
      productsCart.quantity -= 1;
      cartList.value = List<ProductCart>.from(cartList.value);
      calculateTotals(cartList.value);
    }
  }

  void calculateTotals(List<ProductCart> temp) {
    final total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    totalItems(total);

    final totalCost = temp.fold(
        0.0,
        (previousValue, element) =>
            (element.quantity * element.product.price) + previousValue);
    totalPrice(totalCost);
  }

  void deleteProduct(ProductCart productsCart) {
    cartList.remove(productsCart);
    calculateTotals(cartList.value);
  }
}
