import 'package:flutter/material.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              child: FancyPasswordField(
                validationRules: const {
                  ValidationRule.specialCharacter,
                  ValidationRule.uppercaseLetter,
                },
                validationRulePassedBuilder: (rule) {
                  return Chip(
                    backgroundColor: Colors.green,
                    label: Text(rule),
                  );
                },
                validationRuleNotPassedBuilder: (rule) {
                  return Chip(
                    backgroundColor: Colors.grey,
                    label: Text(rule),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
