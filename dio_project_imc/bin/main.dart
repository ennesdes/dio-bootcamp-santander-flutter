import 'dart:io';

import 'package:dio_project_imc/model/person.dart';

void main() {
  try {
    double height;
    double weight;
    String name;

    stdout.write("Informe o nome da pessoa: ");
    name = stdin.readLineSync();

    while (true) {
      stdout.write("Informe o peso (em kg): ");
      weight = double.tryParse(stdin.readLineSync());

      if (weight != null) {
        break;
      } else {
        print("Favor insira um valor válido");
      }
    }

    while (true) {
      stdout.write("Informe a altura (em metros): ");
      height = double.tryParse(stdin.readLineSync());

      if (height != null) {
        break;
      } else {
        print("Favor insira um valor válido");
      }
    }

    Person person = Person(name, weight, height);

    double imc = person.calculateIMC(person);
    String classifyIMC = person.getClassifyIMC(imc);

    print('--------------------INICIO------------------------');
    print('Resultados do IMC do ${person.name}:');
    print('Peso: ${person.weight} kg');
    print('Altura: ${person.height} m');
    print('IMC: $imc');
    print('Classificação atual: $classifyIMC');
    print('----------------------FIM----------------------');
  } catch (e) {
    print("Erro na execução do código: $e");
  }
}
