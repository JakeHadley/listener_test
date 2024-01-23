import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listener_test/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders app', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
