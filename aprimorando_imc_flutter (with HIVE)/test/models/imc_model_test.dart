import 'package:aprimorando_imc_flutter/models/imc_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Teste criando imc 1', () {
    final imcModelTest = ImcModel(76, 180, 'douglas');

    test('Retorno correto do calculo de IMC', () {
      expect(
        imcModelTest.calculateIMC(imcModelTest.weight, imcModelTest.height),
        greaterThanOrEqualTo(23),
      );
    });

    test('Retorno correto da classificação de IMC', () {
      expect(imcModelTest.getClassifyIMC(15.5), equals('Magreza grave'));
      expect(imcModelTest.getClassifyIMC(16.5), equals('Magreza moderada'));
    });
  });
}
