import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruteria/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  _ProductCardState createState() => _ProductCardState();

  int? selectedGrams;
  TextEditingController? gramsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black38, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 20,
          shadowColor: Colors.green.shade200,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          color: Colors.black12,
                          border: Border.all(width: 1, color: Colors.black12)),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50, // Tamaño del CircleAvatar
                          child: ClipOval(
                            child: Image.asset(
                              'apple.png', // Reemplaza con la URL de tu imagen
                              // Alto de la imagen
                              fit: BoxFit
                                  .cover, // Ajuste de la imagen dentro del ClipOval
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${widget.product.price.toStringAsFixed(2)} EUR/Kg',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextField(
                              controller: gramsController,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Gramos',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(FontAwesomeIcons.check),
                              onPressed: () {
                                if (gramsController!.text.isNum) {
                                  Get.defaultDialog(
                                      title: "Gracias por comprar",
                                      middleText:
                                          "Se han agregado ${gramsController?.value.text} de Manzana a tu Cesta");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
