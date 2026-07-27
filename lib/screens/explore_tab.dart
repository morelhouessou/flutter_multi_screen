import 'package:flutter/material.dart';
import '../data/item_repository.dart';
import '../models/item.dart';
import '../models/details_screen_args.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final _searchCtrl = TextEditingController();
  bool _evenOnly = false;
  late List<Item> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = ItemRepository.items;
    _searchCtrl.addListener(_updateFilteredItems);
  }

  @override
  void dispose() {
    _searchCtrl.removeListener(_updateFilteredItems);
    _searchCtrl.dispose();
    super.dispose();
  }

  void _updateFilteredItems() {
    setState(() {
      _filteredItems = ItemRepository.filterItems(
        _searchCtrl.text,
        evenOnly: _evenOnly,
      );
    });
  }

  void _toggleEvenOnly(bool? value) {
    setState(() {
      _evenOnly = value ?? false;
      _filteredItems = ItemRepository.filterItems(
        _searchCtrl.text,
        evenOnly: _evenOnly,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchCtrl,
            decoration: const InputDecoration(
              labelText: 'Rechercher',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Checkbox(value: _evenOnly, onChanged: _toggleEvenOnly),
              const Expanded(child: Text('Afficher seulement les éléments pairs')),
            ],
          ),
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(child: Text('Aucun résultat trouvé'))
                : ListView.separated(
                    itemCount: _filteredItems.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text('${item.id}')),
                        title: Text(item.title),
                        subtitle: Text(item.category),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: DetailsScreenArgs(
                              itemId: item.id,
                              title: item.title,
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
