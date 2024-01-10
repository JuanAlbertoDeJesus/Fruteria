import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/Prouct.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }
}

class MyCardController extends GetxController {
  void showAlertDialog(Product producto) {
    final CounterController counterController = Get.put(CounterController());
    final TextEditingController numberController = TextEditingController();

    Get.defaultDialog(
        title: producto.nombre,
        middleText: producto.precio.toString() + "/200Grs",
        content: TextField(
          textAlign: TextAlign.center,
          controller: numberController,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              alignLabelWithHint: true,
              labelText: 'Ingrese un número',
              labelStyle: TextStyle(inherit: true)),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      counterController.increment();
                      numberController.text =
                          counterController.count.toString();
                    },
                    child: Icon(FontAwesomeIcons.minus,
                        color: Colors.blueGrey.shade100),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      counterController.decrement();
                    },
                    child: Icon(FontAwesomeIcons.plus,
                        color: Colors.blueGrey.shade100),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancelar'),
              ),
            ],
          ),
        ]);
  }

  void updateCardSize(double width, double height) {}
}

class ProductCardV2 extends StatelessWidget {
  final MyCardController controller = Get.put(MyCardController());

  final Product product;
  ProductCardV2({super.key, required this.product});
// el builder de OBX necesita recibir un bs dentro de el y asi se adapta cuando ese obs cambie, podemos hacerlo creado un obs con el tamaño de la vista y ahi adaptar el tamaño
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GetBuilder(
                init:
                    MyCardController(), // Asegúrate de tener un controlador GetX
                builder: (MyCardController controller) {
                  double parentWidth = MediaQuery.of(context).size.width;

                  return ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20.0), // Ajusta este valor según tus necesidades
                      child: Image.network(
                        product.image.toString(),
                        fit: BoxFit.cover,
                      ));
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      product.nombre.toString(),
                      style: GoogleFonts.bitter(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      product.precio.toString() +
                          '€/' +
                          product.minGrams.toString() +
                          "Grs",
                      style: GoogleFonts.bitter(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.showAlertDialog(product);
                  },
                  child: Text('Agregar a la cesta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
