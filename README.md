# Flutter Multi-Écrans — Démo de navigation

Petite application Flutter illustrant les principales techniques de navigation.

## Structure

```
lib/
├── main.dart                  # MaterialApp, routes nommées + onGenerateRoute
├── screens/
│   ├── login_screen.dart      # pushReplacementNamed
│   ├── home_shell.dart        # BottomNavigationBar + IndexedStack + Drawer
│   ├── home_tab.dart          # push avec arguments + valeur de retour (await)
│   ├── explore_tab.dart       # liste -> détail
│   ├── profile_tab.dart       # onglet simple
│   ├── details_screen.dart    # reçoit des arguments, fait un pop(valeur)
│   └── settings_screen.dart   # accessible via le Drawer
└── widgets/
    └── app_drawer.dart        # menu latéral + pushNamedAndRemoveUntil (déconnexion)
```

## Techniques de navigation couvertes

| Technique | Où | Usage |
|---|---|---|
| `routes` (table statique) | `main.dart` | Routes simples sans argument (`/`, `/home`, `/settings`) |
| `onGenerateRoute` | `main.dart` | Route dynamique `/details` avec arguments typés |
| `Navigator.pushNamed` | `home_tab.dart`, `explore_tab.dart` | Navigation vers le détail |
| `await Navigator.push...` + `pop(valeur)` | `home_tab.dart` / `details_screen.dart` | Récupérer un résultat depuis l'écran suivant |
| `pushReplacementNamed` | `login_screen.dart` | Remplacer l'écran (pas de retour arrière) |
| `pushNamedAndRemoveUntil` | `app_drawer.dart` | Déconnexion : vider toute la pile |
| `BottomNavigationBar` (`NavigationBar`) + `IndexedStack` | `home_shell.dart` | Navigation par onglets sans navigation "push" |
| `Drawer` | `app_drawer.dart` | Menu latéral partagé |
| `onUnknownRoute` | `main.dart` | Page 404 si route inconnue |

## Lancer le projet

Prérequis : [Flutter SDK](https://docs.flutter.dev/get-started/install) installé.

```bash
cd flutter_multi_screen
flutter pub get
flutter run
```

## Flux de l'app

1. **Login** → validation d'un formulaire → `pushReplacementNamed('/home')`
2. **Home** (Accueil / Explorer / Profil via onglets bas) → tap sur un item → `Details`
3. **Details** → `pop(valeur)` renvoyé à l'écran appelant, ou accessible aussi via `/details` directement
4. **Drawer** (accessible depuis n'importe quel onglet) → `Settings` ou déconnexion vers `Login`
