import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_screen/screens/explore_tab.dart';

void main() {
  testWidgets('Recherche et filtre dans ExploreTab', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: ExploreTab()),
      ),
    );

    expect(find.text('Aucun résultat trouvé'), findsNothing);
    expect(find.byType(ListTile), findsWidgets);

    await tester.enterText(find.byType(TextField), 'Élément 2');
    await tester.pumpAndSettle();

    expect(find.text('Élément 2'), findsWidgets);
    expect(find.text('Élément 1'), findsNothing);

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    expect(find.textContaining('Élément 2'), findsWidgets);
  });
}
