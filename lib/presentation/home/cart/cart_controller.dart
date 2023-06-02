import 'package:flutter_delivery_app_clean_architecture/domain/model/product_card_model.dart';
import 'package:flutter_delivery_app_clean_architecture/domain/model/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItems = 0.obs;

  void increment(Products products) {
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

    final total = temp.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    totalItems(total);
  }

  void decrement(Products products) {
    final temp = List<ProductCart>.from(cartList.value);
    for (ProductCart p in temp) {
      if (p.product.name == products.name) {
        if (p.quantity > 1) {
          p.quantity -= 1;
        }
        break;
      }
    }

    cartList.value = List<ProductCart>.from(temp);
  }

  void deleteProduct(ProductCart productsCart) {}
}
