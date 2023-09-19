import 'package:dio_project_imc/model/person.dart';
import 'package:test/test.dart';

void main() {
  group('Teste Pessoa 1', () {
    final person = Person('John', 70.0, 1.75);

    test('Retorno correto do calculo de IMC', () {
      expect(
        person.calculateIMC(person),
        greaterThanOrEqualTo(22),
      );
    });

    test('Retorno correto da classificação de IMC', () {
      expect(person.getClassifyIMC(15.5), equals('Magreza grave'));
      expect(person.getClassifyIMC(16.5), equals('Magreza moderada'));
    });
  });

  group('Teste Pessoa 2', () {
    final person = Person('John', 100.0, 1.60);

    test('Retorno correto do calculo de IMC', () {
      expect(
        person.calculateIMC(person),
        greaterThanOrEqualTo(38),
      );
    });

    test('Retorno correto da classificação de IMC', () {
      expect(
        person.getClassifyIMC(person.calculateIMC(person)),
        equals('Obesidade Grau II (severa)'),
      );
    });
  });
}
