import '../models/item.dart';

class ItemRepository {
  static const List<Item> items = [
    Item(id: 1, title: 'Élément 1', category: 'Couleur'),
    Item(id: 2, title: 'Élément 2', category: 'Couleur'),
    Item(id: 3, title: 'Élément 3', category: 'Forme'),
    Item(id: 4, title: 'Élément 4', category: 'Forme'),
    Item(id: 5, title: 'Élément 5', category: 'Taille'),
    Item(id: 6, title: 'Élément 6', category: 'Taille'),
    Item(id: 7, title: 'Élément 7', category: 'Poids'),
    Item(id: 8, title: 'Élément 8', category: 'Poids'),
    Item(id: 9, title: 'Élément 9', category: 'Charge'),
    Item(id: 10, title: 'Élément 10', category: 'Charge'),
    Item(id: 11, title: 'Élément 11', category: 'Type'),
    Item(id: 12, title: 'Élément 12', category: 'Type'),
    Item(id: 13, title: 'Élément 13', category: 'Niveau'),
    Item(id: 14, title: 'Élément 14', category: 'Niveau'),
    Item(id: 15, title: 'Élément 15', category: 'Statut'),
  ];

  static List<Item> filterItems(String query, {bool evenOnly = false}) {
    final normalizedQuery = query.trim().toLowerCase();
    return items.where((item) {
      final matchesQuery = normalizedQuery.isEmpty ||
          item.title.toLowerCase().contains(normalizedQuery) ||
          item.category.toLowerCase().contains(normalizedQuery);
      final matchesEven = !evenOnly || item.id.isEven;
      return matchesQuery && matchesEven;
    }).toList();
  }
}
