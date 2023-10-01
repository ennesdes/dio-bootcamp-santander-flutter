import 'package:aprimorando_imc_flutter/models/imc_model.dart';
import 'package:aprimorando_imc_flutter/repositories/imc_hive_repository.dart';
import 'package:get/get.dart';

class CalculateImcController extends GetxController {
  var listHistoricImc = <ImcModel>[].obs;
  ImcModel? lastImcModel;

  late ImcHiveRepository _imcRepository;

  Future<void> init() async {
    _imcRepository = await ImcHiveRepository.load();

    loadHistoricImc();
    loadLastImcModel();
  }

  void loadHistoricImc() {
    listHistoricImc.clear();
    listHistoricImc = _imcRepository.getListHistoricImc().obs;
    listHistoricImc.refresh();
  }

  void loadLastImcModel() {
    if (listHistoricImc.isNotEmpty) {
      lastImcModel = listHistoricImc.last;
    } else {
      lastImcModel = null;
    }
  }

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

  String? validateInputString(String? value) {
    if (value != null && value.isNotEmpty) {
      var valueFinal = value.trim();

      if (valueFinal == '') {
        return 'Nome esta vazio';
      }
    } else {
      return 'Insira um nome';
    }

    return null;
  }

  void addNewImc({
    String height = '',
    String name = '',
    String weight = '',
  }) {
    var imcModel = ImcModel(double.parse(weight), int.parse(height), name);

    _imcRepository.saveImc(imcModel);
    loadHistoricImc();
  }
}
