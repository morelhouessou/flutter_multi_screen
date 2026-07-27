import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.notifications_outlined), title: Text('Notifications')),
          ListTile(leading: Icon(Icons.dark_mode_outlined), title: Text('Thème sombre')),
          ListTile(leading: Icon(Icons.language_outlined), title: Text('Langue')),
          ListTile(leading: Icon(Icons.privacy_tip_outlined), title: Text('Confidentialité')),
        ],
      ),
    );
  }
}
