import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Utilisateur Démo'),
            accountEmail: Text('demo@exemple.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Paramètres'),
            onTap: () {
              Navigator.pop(context); // ferme le drawer
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Se déconnecter'),
            onTap: () {
              // On revient à l'écran de login en vidant toute la pile
              // de navigation (aucun retour arrière possible ensuite).
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
