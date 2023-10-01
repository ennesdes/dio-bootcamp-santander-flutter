import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel {
  @HiveField(0)
  final double weight;

  @HiveField(1)
  final int height;

  @HiveField(2)
  final String name;

  @HiveField(3)
  late double imc;

  @HiveField(4)
  late String classify;

  @HiveField(5)
  late String date;

  ImcModel(
    this.weight,
    this.height,
    this.name,
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
