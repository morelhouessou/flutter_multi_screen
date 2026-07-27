import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_screen/screens/profile_form_screen.dart';

void main() {
  testWidgets('ProfileFormScreen valide les champs requis', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileFormScreen()));

    await tester.tap(find.text('Enregistrer'));
    await tester.pump();

    expect(find.text('Entrez votre nom complet'), findsOneWidget);
    expect(find.text('Entrez un e-mail valide'), findsOneWidget);
    expect(find.text('Entrez un numéro valide'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
    await tester.enterText(find.byType(TextFormField).at(1), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), '01234567');
    await tester.tap(find.text('Enregistrer'));
    await tester.pump();

    expect(find.text('Profil enregistré pour Test User'), findsOneWidget);
  });
}
