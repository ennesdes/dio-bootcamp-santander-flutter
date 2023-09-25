import 'package:aprimorando_imc_flutter/models/imc_model.dart';
import 'package:flutter/material.dart';

class IMCTileAdapter extends StatelessWidget {
  final ImcModel imcModel;

  const IMCTileAdapter({super.key, required this.imcModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(imcModel.date),
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
          crossAxisAlignment: CrossAxisAlignment.end,
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
                imcModel.classify,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
