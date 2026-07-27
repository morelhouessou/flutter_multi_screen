import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int itemId;
  final String title;

  const DetailsScreen({
    super.key,
    required this.itemId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID : $itemId', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            const Text(
              'Ceci est l\'écran de détail. Il a reçu des arguments via '
              'Navigator.pushNamed(context, "/details", arguments: {...}) '
              'et peut renvoyer une valeur à l\'écran précédent avec '
              'Navigator.pop(context, valeur).',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Renvoie une valeur à l'écran appelant (utile avec `await`)
                  Navigator.pop(context, 'Élément $itemId validé ✅');
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
