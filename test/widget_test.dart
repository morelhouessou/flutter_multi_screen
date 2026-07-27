import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_multi_screen/main.dart';

void main() {
  testWidgets('L application affiche l écran de connexion au démarrage', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenue'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
