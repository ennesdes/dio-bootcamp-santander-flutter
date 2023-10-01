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
  final name = TextEditingController();
  final weight = TextEditingController();

  final controller = Get.put(CalculateImcController());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (controller.lastImcModel != null) {
            name.text = controller.lastImcModel!.name;
            height.text = controller.lastImcModel!.height.toString();
            weight.text = controller.lastImcModel!.weight.toString();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: name,
                    maxLength: 15,
                    validator: (value) {
                      return controller.validateInputString(value);
                    },
                    decoration: const InputDecoration(
                      label: Text(
                        'Informe seu nome',
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
                    maxLength: 3,
                    controller: height,
                    keyboardType: TextInputType.number,
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
                    maxLength: 5,
                    controller: weight,
                    keyboardType: TextInputType.number,
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
                        controller.addNewImc(
                          height: height.text,
                          name: name.text,
                          weight: weight.text,
                        );
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
