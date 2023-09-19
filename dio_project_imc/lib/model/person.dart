class Person {
  String name;
  double weight;
  double height;

  Person(this.name, this.weight, this.height);

  double calculateIMC(Person person) {
    double imc = person.weight / (person.height * person.height);

    return double.tryParse(imc.toStringAsFixed(2));
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
