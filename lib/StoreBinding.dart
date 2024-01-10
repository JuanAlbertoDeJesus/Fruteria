import 'package:fruteria/controllers/StoreController.dart';
import 'package:fruteria/services/ProductProvider.dart';
import 'package:fruteria/services/ProductRepository.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ProductRepository(storeProvider: ProductProvider())));
  }
}
