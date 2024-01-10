import 'dart:convert';

import 'package:fruteria/services/ProductService.dart';
import 'package:get/get.dart';

import '../constants/keys.dart';
import '../models/Prouct.dart';

class ProductProvider {
  final ProductService _productService = Get.find<ProductService>();

  List<Product> readReviews() {
    var products = <Product>[];
    jsonDecode(_productService.read(reviewsKey).toString())
        .forEach((e) => products.add(Product.fromJson(e)));
    return products;
  }

  void writeReview(List<Product> reviews) {
    _productService.write(reviewsKey, jsonEncode(reviews));
  }
}
