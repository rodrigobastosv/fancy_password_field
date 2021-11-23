import 'package:fancy_password_field/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final strengthVariant = ValueVariant<double>(
    {
      .1,
      .3,
      .6,
      .8,
    },
  );

  Future<void> loadWidget(
    WidgetTester tester, {
    required double strengthValue,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DefaultStrengthIndicator(strengthValue),
        ),
      ),
    );
  }

  testWidgets(
    'should show correct label and color for the indicator',
    (tester) async {
      final strengthValue = strengthVariant.currentValue!;

      await loadWidget(tester, strengthValue: strengthValue);

      if (strengthValue == .1) {
        expect(find.text('Weak'), findsOneWidget);
        // Create widget matcher for that
        expect(
          find.byWidgetPredicate(
            (widget) => widget is Text && widget.style!.color == Colors.red,
          ),
          findsOneWidget,
        );
      } else if (strengthValue == .3) {
        expect(find.text('Fair'), findsOneWidget);
        expect(
          find.byWidgetPredicate(
            (widget) => widget is Text && widget.style!.color == Colors.yellow,
          ),
          findsOneWidget,
        );
      } else if (strengthValue == .6) {
        expect(find.text('Good'), findsOneWidget);
        expect(
          find.byWidgetPredicate(
            (widget) => widget is Text && widget.style!.color == Colors.blue,
          ),
          findsOneWidget,
        );
      } else if (strengthValue == .8) {
        expect(find.text('Strong'), findsOneWidget);
        expect(
          find.byWidgetPredicate(
            (widget) => widget is Text && widget.style!.color == Colors.green,
          ),
          findsOneWidget,
        );
      }
    },
    variant: strengthVariant,
  );
}
