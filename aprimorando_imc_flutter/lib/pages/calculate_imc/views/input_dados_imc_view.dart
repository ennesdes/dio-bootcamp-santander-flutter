import 'package:aprimorando_imc_flutter/pages/calculate_imc/calculate_imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputDadosIMC extends StatefulWidget {
  const InputDadosIMC({super.key});

  @override
  State<InputDadosIMC> createState() => _InputDadosIMCState();
}

class _InputDadosIMCState extends State<InputDadosIMC> {
  final height = TextEditingController();
  final weight = TextEditingController();

  final controller = Get.put(CalculateImcController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: height,
              validator: (value) {
                return controller.validateInputInt(value);
              },
              decoration: const InputDecoration(
                label: Text(
                  'Informe sua altura (cm)',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: weight,
              validator: (value) {
                return controller.validateInputDouble(value);
              },
              decoration: const InputDecoration(
                label: Text(
                  'Informe seu peso (kg)',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.addNewImc(height.text, weight.text);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: const Text('CALCULAR IMC'),
            ),
          ],
        ),
      ),
    );
  }
}
