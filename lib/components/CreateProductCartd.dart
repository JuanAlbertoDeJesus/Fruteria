import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CreateProductCartd extends StatelessWidget {
  const CreateProductCartd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    return Card(
      elevation: 50,
      color: Colors.white,
      child: Container(
        width: Get.width * 0.6,
        height: Get.height * 0.4,
        padding: const EdgeInsets.all(26),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                key: _emailFieldKey,
                name: 'Nombre dde producto',
                decoration:
                    const InputDecoration(labelText: 'Nombre dde producto'),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'Precio',
                decoration: const InputDecoration(labelText: 'Precio'),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'Cantidad disponible',
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  // Validate and save the form values
                  _formKey.currentState?.saveAndValidate();
                  debugPrint(_formKey.currentState?.value.toString());

                  // On another side, can access all field values without saving form with instantValues
                  _formKey.currentState?.validate();
                  debugPrint(_formKey.currentState?.instantValue.toString());
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
