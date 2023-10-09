import 'package:dio_project_consult_cep/models/address_model.dart';
import 'package:dio_project_consult_cep/models/viacep_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoadingCepActual = false.obs;
  var isLoadingListCep = false.obs;
  var isFormUpdateCepEdited = false.obs;
  var viacepActual = ViaCepModel().obs;
  var listCeps = <Address>[].obs;

  bool verifyExist(ViaCepModel viaCepModel) {
    String cepToFind = viaCepModel.cep!;
    bool exists = false;

    for (Address address in listCeps) {
      if (address.cep == cepToFind) {
        exists = true;
        break;
      }
    }

    return exists;
  }
}
