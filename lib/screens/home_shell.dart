import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'explore_tab.dart';
import 'profile_tab.dart';
import '../widgets/app_drawer.dart';

/// HomeShell = la "coquille" de l'app une fois connecté.
/// Elle gère la BottomNavigationBar et bascule entre 3 onglets,
/// tout en gardant leur état vivant grâce à IndexedStack.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final _tabs = const [
    HomeTab(),
    ExploreTab(),
    ProfileTab(),
  ];

  final _titles = const ['Accueil', 'Explorer', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      drawer: const AppDrawer(),
      // IndexedStack garde chaque onglet monté (scroll, formulaires, etc.
      // ne sont pas perdus quand on change d'onglet).
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Explorer'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
