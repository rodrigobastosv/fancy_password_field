import 'package:example/main.dart';
import 'package:example/samples/samples.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('MyApp builds a FancyPasswordField', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(FancyPasswordField), findsOneWidget);
  });

  const samples = <String, Widget>{
    'Sample1': Sample1(),
    'Sample2': Sample2(),
    'Sample3': Sample3(),
    'Sample4': Sample4(),
    'SampleInitialValue': SampleInitialValue(),
  };

  samples.forEach((name, sample) {
    testWidgets('$name accepts input', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: sample)));

      await tester.enterText(find.byType(TextFormField), 'Passw0rd!');
      await tester.pumpAndSettle();

      expect(find.byType(FancyPasswordField), findsOneWidget);
    });
  });
}
