import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
          const SizedBox(height: 16),
          Text('Utilisateur Démo', style: Theme.of(context).textTheme.titleLarge),
          const Text('demo@exemple.com'),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/profile-form'),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Modifier le profil'),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            icon: const Icon(Icons.settings_outlined),
            label: const Text('Paramètres'),
          ),
        ],
      ),
    );
  }
}
