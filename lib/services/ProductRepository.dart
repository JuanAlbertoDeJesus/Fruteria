import '../models/Prouct.dart';
import 'ProductProvider.dart';

class ProductRepository {
  ProductProvider storeProvider;
  ProductRepository({required this.storeProvider});

  List<Product> reaProdducts() => storeProvider.readReviews();
  void writeProducts(List<Product> reviews) =>
      storeProvider.writeReview(reviews);
}
