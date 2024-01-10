import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductService extends GetxService {
  late GetStorage _box;

  Future<ProductService> init() async {
    _box = GetStorage();
    //  await _box.writeIfNull(reviewsKey, []);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
