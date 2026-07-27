import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Bonjour 👋', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Voici un exemple de navigation avec passage d\'arguments.'),
        const SizedBox(height: 24),
        Card(
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Voir le détail #42'),
            subtitle: const Text('Navigator.pushNamed avec arguments'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: {'id': 42, 'title': 'Article n°42'},
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.reply_outlined),
            title: const Text('Écran de détail avec valeur de retour'),
            subtitle: const Text('await Navigator.push(...)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final resultat = await Navigator.pushNamed(
                context,
                '/details',
                arguments: {'id': 7, 'title': 'Article n°7'},
              );
              if (context.mounted && resultat != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Retour reçu : $resultat')),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
