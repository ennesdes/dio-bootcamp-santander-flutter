import 'package:intl/intl.dart';

class ImcModel {
  final double weight;
  final int height;
  late double imc;
  late String classify;
  late String date;

  ImcModel(
    this.weight,
    this.height,
  ) {
    imc = calculateIMC(weight, height);
    classify = getClassifyIMC(imc);
    date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  double calculateIMC(double weight, int height) {
    double heightInMeters = height / 100.0;
    double imc = weight / (heightInMeters * heightInMeters);

    return double.parse(imc.toStringAsFixed(2));
  }

  String getClassifyIMC(double imc) {
    if (imc < 16) return "Magreza grave";

    if (imc >= 16 && imc < 17) return "Magreza moderada";

    if (imc >= 17 && imc < 18.5) return "Magreza leve";

    if (imc >= 18.5 && imc < 25) return "Saudável";

    if (imc >= 25 && imc < 30) return "Sobrepeso";

    if (imc >= 30 && imc < 35) return "Obesidade Grau I";

    if (imc >= 35 && imc < 40) return "Obesidade Grau II (severa)";

    return "Obesidade Grau III (mórbida)";
  }
}
