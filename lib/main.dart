import 'package:flutter/material.dart';
import 'models/details_screen_args.dart';
import 'screens/details_screen.dart';
import 'screens/home_shell.dart';
import 'screens/login_screen.dart';
import 'screens/profile_form_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Écrans Demo',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeShell(),
        '/settings': (context) => SettingsScreen(
              isDarkMode: _themeMode == ThemeMode.dark,
              onThemeChanged: _toggleTheme,
            ),
        '/profile-form': (context) => const ProfileFormScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final args = settings.arguments;
          if (args is DetailsScreenArgs) {
            return MaterialPageRoute(
              builder: (context) => DetailsScreen(args: args),
              settings: settings,
            );
          }

          if (args is Map<String, dynamic>) {
            return MaterialPageRoute(
              builder: (context) => DetailsScreen(
                args: DetailsScreenArgs(
                  itemId: args['id'] as int? ?? 0,
                  title: args['title'] as String? ?? 'Détail',
                ),
              ),
              settings: settings,
            );
          }
        }
        return null;
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
