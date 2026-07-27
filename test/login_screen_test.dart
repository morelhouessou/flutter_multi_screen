import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_screen/screens/login_screen.dart';

void main() {
  testWidgets('Le formulaire affiche plusieurs champs et valide les erreurs', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(find.byType(TextFormField), findsNWidgets(4));
    expect(find.text('Nom complet'), findsOneWidget);
    expect(find.text('Adresse e-mail'), findsOneWidget);
    expect(find.text('Mot de passe'), findsOneWidget);
    expect(find.text('Confirmer le mot de passe'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), '');
    await tester.enterText(find.byType(TextFormField).at(1), 'mauvais-email');
    await tester.enterText(find.byType(TextFormField).at(2), '123');
    await tester.enterText(find.byType(TextFormField).at(3), '1234');
    await tester.tap(find.text('Se connecter'));
    await tester.pump();

    expect(find.text('Entrez votre nom complet'), findsOneWidget);
    expect(find.text('Entrez un e-mail valide'), findsOneWidget);
    expect(find.text('Le mot de passe doit contenir au moins 6 caractères'), findsOneWidget);
  });
}
