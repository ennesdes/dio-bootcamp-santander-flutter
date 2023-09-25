import 'package:aprimorando_imc_flutter/models/imc_model.dart';
import 'package:get/get.dart';

class CalculateImcController extends GetxController {
  var listHistoricImc = <ImcModel>[].obs;

  String? validateInputDouble(String? value) {
    if (value != null && value.isNotEmpty) {
      var valueFinal = double.tryParse(value.trim());

      if (valueFinal == null) {
        return 'Insira um número válido';
      }
    } else {
      return 'Insira uma altura';
    }

    return null;
  }

  String? validateInputInt(String? value) {
    if (value != null && value.isNotEmpty) {
      var valueFinal = int.tryParse(value.trim());

      if (valueFinal == null) {
        return 'Insira um número válido';
      }
    } else {
      return 'Insira uma altura';
    }

    return null;
  }

  void addNewImc(String height, String weight) {
    var imcModel = ImcModel(
      double.parse(weight),
      int.parse(height),
    );

    listHistoricImc.add(imcModel);
    listHistoricImc.refresh();
  }
}
