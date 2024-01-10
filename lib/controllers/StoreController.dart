import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/Prouct.dart';
import '../services/ProductRepository.dart';

class StoreController extends GetxController {
  ProductRepository repository;
  StoreController({required this.repository});

  final storeName = 'Thick Shake'.obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final products = <Product>[].obs;
  final storeNameEditingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  final followerController = TextEditingController();
  final reviewNameController = TextEditingController();
  int storeFollowerCount = 0;
  // You do not need that. I recommend using it just for ease of syntax.
  /// with static method: Controller.to.increment();
  /// with no static method: Get.find<Controller>().increment();
  /// There is no difference in performance, nor any side effect of using either
  /// syntax. Only one does not need the type,
  /// and the other the IDE will autocomplete it.
  static StoreController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    products.assignAll(repository.reaProdducts());
    ever(products, (_) => repository.writeProducts(products));
  }

  void incrementStoreFollowers() {
    storeFollowerCount++;
    update();
  }

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount(followerCount.value + 1);
  }

  void storeStatusOpen(bool isOpen) {
    storeStatus(isOpen);
  }

  updateFollowerList(List<String> list) {
    followerList.assignAll(list);
  }

  addNewFollower(String name) {
    followerList.add(name);
  }

  void addReview(Product storeReviews) {
    products.add(storeReviews);
  }

  @override
  void dispose() {
    storeNameEditingController.dispose();
    reviewEditingController.dispose();
    super.dispose();
  }
}
