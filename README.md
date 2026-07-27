# Flutter Multi-Écrans — Démo de navigation

Petite application Flutter illustrant les principales techniques de navigation, de gestion des données et de responsive design.

## Structure

```
lib/
├── main.dart                      # MaterialApp, routes nommées + onGenerateRoute
├── data/
│   └── item_repository.dart       # données séparées du UI + filtre/recherche
├── models/
│   ├── item.dart                  # modèle métier pour les éléments
│   └── details_screen_args.dart   # arguments typés pour DetailsScreen
├── screens/
│   ├── login_screen.dart          # formulaire de connexion validé
│   ├── home_shell.dart            # onglets + responsive NavigationRail
│   ├── home_tab.dart              # navigation push/await + résultats
│   ├── explore_tab.dart           # liste avec recherche et filtre
│   ├── profile_tab.dart           # profil utilisateur + navigation vers formulaire
│   ├── profile_form_screen.dart   # formulaire profil 3 champs + validation
│   ├── details_screen.dart        # écran de détail avec retour de valeur
│   ├── settings_screen.dart       # paramètres + thème sombre activable
│   └── login_screen.dart          # écran de connexion
└── widgets/
    └── app_drawer.dart            # drawer avec déconnexion et navigation
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

1. **Login** → validation d'un formulaire utilisateur centralisé (nom, e-mail, mot de passe, confirmation) → `pushReplacementNamed('/home')`
2. **Home** (Accueil / Explorer / Profil via onglets bas) → sélection d'un item ou navigation interne
3. **Explore** → liste de données séparées dans `ItemRepository`, recherche textuelle et filtre sur les éléments pairs
4. **Details** → écran dynamique créé via `onGenerateRoute` et `DetailsScreenArgs`, avec retour d'une valeur à l'écran précédent
5. **Profil** → navigation vers `ProfileFormScreen`, formulaire de 3 champs validé
6. **Paramètres** → option de thème sombre activable et interface de configuration
7. **Drawer** → navigation transversale + déconnexion avec `pushNamedAndRemoveUntil`
