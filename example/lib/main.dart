import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';

import 'samples/samples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Change this to one of the available samples on the samples folder
            //Sample1(),
            Center(
              child: SizedBox(
              width: 400,
              child: FancyPasswordField(
                  validationRules: {
                      DigitValidationRule(),
                      UppercaseValidationRule(),
                      LowercaseValidationRule(),
                      SpecialCharacterValidationRule(),
                      MinCharactersValidationRule(6),
                      MaxCharactersValidationRule(12),
                  },
                  strengthIndicatorBuilder: (strength) => Text(
                    strength.toString(),
                  ),
                  validationRuleBuilder: (rules, value) {
                    if (value.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return ListView(
                      shrinkWrap: true,
                      children: rules
                          .map(
                            (rule) => rule.validate(value)
                                ? Row(
                                    children: [
                                      const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                          rule.name,
                                          style: const TextStyle(
                                              color: Colors.green,
                                          ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                          rule.name,
                                          style: const TextStyle(
                                              color: Colors.red,
                                          ),
                                      ),
                                    ],
                                  ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
