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
    final isWideScreen = MediaQuery.of(context).size.width >= 700;
    const destinations = [
      NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Accueil'),
      NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Explorer'),
      NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profil'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      drawer: const AppDrawer(),
      body: isWideScreen
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (index) => setState(() => _currentIndex = index),
                  labelType: NavigationRailLabelType.selected,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: Text('Accueil')),
                    NavigationRailDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: Text('Explorer')),
                    NavigationRailDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: Text('Profil')),
                  ],
                ),
                Expanded(
                  child: IndexedStack(
                    index: _currentIndex,
                    children: _tabs,
                  ),
                ),
              ],
            )
          : IndexedStack(
              index: _currentIndex,
              children: _tabs,
            ),
      bottomNavigationBar: isWideScreen
          ? null
          : NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) => setState(() => _currentIndex = index),
              destinations: destinations,
            ),
    );
  }
}
