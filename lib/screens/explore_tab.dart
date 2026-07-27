import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(15, (i) => 'Élément ${i + 1}');

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(items[index]),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: {'id': index + 1, 'title': items[index]},
            );
          },
        );
      },
    );
  }
}
