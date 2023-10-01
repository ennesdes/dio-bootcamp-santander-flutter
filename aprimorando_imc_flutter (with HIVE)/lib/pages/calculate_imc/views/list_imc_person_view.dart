import 'package:aprimorando_imc_flutter/pages/calculate_imc/adapters/imc_tile_adapter.dart';
import 'package:aprimorando_imc_flutter/pages/calculate_imc/calculate_imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListIMCPerson extends StatelessWidget {
  ListIMCPerson({super.key});

  final controller = Get.put(CalculateImcController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.listHistoricImc.length,
          itemBuilder: (BuildContext context, int index) {
            return IMCTileAdapter(imcModel: controller.listHistoricImc[index]);
          },
        ),
      ),
    );
  }
}
