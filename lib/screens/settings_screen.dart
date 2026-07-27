import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool>? onThemeChanged;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: [
          SwitchListTile(
            value: isDarkMode,
            onChanged: onThemeChanged,
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Thème sombre'),
            subtitle: const Text('Active ou désactive le thème sombre'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifications'),
          ),
          const ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Langue'),
          ),
          const ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text('Confidentialité'),
          ),
        ],
      ),
    );
  }
}
