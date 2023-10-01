import 'package:aprimorando_imc_flutter/models/imc_model.dart';
import 'package:hive/hive.dart';

class ImcHiveRepository {
  static late Box<ImcModel> boxImc;

  ImcHiveRepository._create();

  static Future<ImcHiveRepository> load() async {
    if (Hive.isBoxOpen('controle_imc')) {
      boxImc = Hive.box<ImcModel>('controle_imc');
    } else {
      boxImc = await Hive.openBox<ImcModel>('controle_imc');
    }

    return ImcHiveRepository._create();
  }

  Future<void> saveImc(ImcModel imcModel) async {
    await boxImc.add(imcModel);
  }

  List<ImcModel> getListHistoricImc() {
    return boxImc.values.cast<ImcModel>().toList();
  }
}
