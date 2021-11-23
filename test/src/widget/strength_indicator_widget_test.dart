import 'package:fancy_password_field/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> loadWidget(
    WidgetTester tester, {
    required StrengthIndicatorBuilder? builder,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StrengthIndicatorWidget(
            password: 'password',
            strengthIndicatorBuilder: builder,
          ),
        ),
      ),
    );
  }

  testWidgets(
    'should build without exploding',
    (tester) async {
      await loadWidget(
        tester,
        builder: null,
      );

      expect(find.byType(StrengthIndicatorWidget), findsOneWidget);
    },
  );

  testWidgets(
    'should show DefaultStrengthIndicator if builder is null',
    (tester) async {
      await loadWidget(
        tester,
        builder: null,
      );

      expect(find.byType(DefaultStrengthIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should execute strengthIndicatorBuilder if one is provided',
    (tester) async {
      await loadWidget(
        tester,
        builder: (strength) => Container(
          key: const ValueKey('widget-from-builder'),
        ),
      );

      expect(find.byKey(const ValueKey('widget-from-builder')), findsOneWidget);
    },
  );
}
