import 'package:flutter/material.dart';
import 'package:fruteria/models/Prouct.dart';
import 'package:fruteria/widgets/product_cardV2.dart';
import 'package:get/get.dart';

class FrutasView extends StatelessWidget {
  const FrutasView({
    super.key,
    required this.productos,
  });

  final List<Product> productos;
  @override
  Widget build(BuildContext context) {
    final MyCardController cardController = Get.find<MyCardController>();

    return GridView.builder(
      controller: ScrollController(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 8.0 : 16.0,
        mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 8.0 : 16.0,
      ),
      itemCount: 5, // Número total de tarjetas que quieres mostrar
      itemBuilder: (context, index) {
        print('Width: ${Get.width}');
        return ProductCardV2(product: productos[index]);
      },
    );
  }
}
