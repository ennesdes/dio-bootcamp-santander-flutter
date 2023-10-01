import 'package:aprimorando_imc_flutter/pages/calculate_imc/calculate_imc_controller.dart';
import 'package:aprimorando_imc_flutter/pages/calculate_imc/views/input_dados_imc_view.dart';
import 'package:aprimorando_imc_flutter/pages/calculate_imc/views/list_imc_person_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculateIMC extends StatelessWidget {
  CalculateIMC({super.key});

  final controller = Get.put(CalculateImcController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Controle de IMC'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              flex: 3,
              child: SingleChildScrollView(child: InputDadosIMC()),
            ),
            Obx(
              () => Visibility(
                visible: controller.listHistoricImc.isNotEmpty,
                child: Text(
                  'Histórico do Índice de massa corporal'.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBox(child: ListIMCPerson())),
          ],
        ),
      ),
    );
  }
}
