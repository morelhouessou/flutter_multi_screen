import 'package:flutter/material.dart';
import '../models/details_screen_args.dart';

class DetailsScreen extends StatelessWidget {
  final DetailsScreenArgs args;

  const DetailsScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID : ${args.itemId}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            const Text(
              'Ceci est l\'écran de détail. Il a reçu des arguments via '
              'une classe dédiée pour sécuriser le typage et peut renvoyer '
              'une valeur à l\'écran précédent avec Navigator.pop(context, valeur).',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context, 'Élément ${args.itemId} validé ✅');
                },
                child: const Text('Valider et revenir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
