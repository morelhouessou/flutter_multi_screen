import 'package:flutter/material.dart';
import 'screens/home_shell.dart';
import 'screens/details_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Écrans Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      // Route de démarrage
      initialRoute: '/',
      // ---- Routes nommées (navigation "classique") ----
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeShell(),
        '/settings': (context) => const SettingsScreen(),
      },
      // ---- Route dynamique avec arguments (onGenerateRoute) ----
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final args = settings.arguments as Map<String, dynamic>? ?? {};
          return MaterialPageRoute(
            builder: (context) => DetailsScreen(
              itemId: args['id'] ?? 0,
              title: args['title'] ?? 'Détail',
            ),
            settings: settings,
          );
        }
        return null; // laisse Flutter gérer les routes inconnues (-> onUnknownRoute)
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const _NotFoundScreen(),
      ),
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page introuvable')),
      body: const Center(child: Text('404 — Cette route n\'existe pas.')),
    );
  }
}
