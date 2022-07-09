import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/login/login_page.dart';

void main() {
  group('Login page', () {
    testWidgets('Should render login page', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(Image), findsNWidgets(2));
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(Text), findsNWidgets(4));

      final firstText = tester.widget<Text>(find.byType(Text).first);

      expect(firstText.data, 'Welcome Back!');
      expect(
        firstText.style!.fontWeight,
        FontWeight.bold,
      );
      expect(firstText.style!.fontSize, 18);

      final myButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));

      expect(myButton.style!.backgroundColor,
          MaterialStateProperty.all(Colors.grey));
      await tester.enterText(
        find.byType(TextField).at(0),
        'alencar.moreira@gabul.dev',
      );
      expect(myButton.style!.backgroundColor,
          MaterialStateProperty.all(Colors.grey));
      await tester.enterText(
        find.byType(TextField).at(1),
        '12345678',
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
          myButton.style!.backgroundColor,
          MaterialStateProperty.all(
            const Color(0xff38C24E),
          ));
    });
  });
}
