import 'package:aprimorando_imc_flutter/models/imc_model.dart';
import 'package:flutter/material.dart';

class IMCTileAdapter extends StatelessWidget {
  final ImcModel imcModel;

  const IMCTileAdapter({super.key, required this.imcModel});

  @override
  Widget build(BuildContext context) {
    String classifyText = imcModel.classify;

    if (classifyText.length > 15) {
      classifyText =
          '${classifyText.substring(0, 15)}\n${classifyText.substring(15)}';
    }
    return Card(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: ListTile(
          isThreeLine: true,
          title: Text(
            '${imcModel.name} - ${imcModel.date}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Altura: ${imcModel.height} cm'),
              Text('Peso: ${imcModel.weight} kg'),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'IMC: ${imcModel.imc}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Flexible(
                child: Text(
                  classifyText,
                  style: TextStyle(
                    color: getStatusClassify(imcModel.imc),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getStatusClassify(double imc) {
    if (imc < 16) return Colors.red;

    if (imc >= 16 && imc < 17) return Colors.orange;

    if (imc >= 17 && imc < 18.5) return const Color(0xFFC4B31C);

    if (imc >= 18.5 && imc < 25) return Colors.green;

    if (imc >= 25 && imc < 30) return const Color(0xFFC4B31C);

    if (imc >= 30 && imc < 35) return Colors.orange;

    if (imc >= 35 && imc < 40) return Colors.red;

    return Colors.purple;
  }
}
