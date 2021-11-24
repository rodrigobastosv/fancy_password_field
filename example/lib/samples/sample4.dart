import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';

class Sample4 extends StatefulWidget {
  const Sample4({
    Key? key,
  }) : super(key: key);

  @override
  State<Sample4> createState() => _Sample4State();
}

class _Sample4State extends State<Sample4> {
  late FancyPasswordController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = FancyPasswordController();
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 400,
            child: FancyPasswordField(
              passwordController: passwordController,
              hasValidationRules: false,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              strengthIndicatorBuilder: (strength) {
                return const SizedBox.shrink();
              },
              validationRules: {
                UppercaseValidationRule(),
                LowercaseValidationRule(),
                DigitValidationRule(),
              },
            ),
          ),
          if (passwordController.ofendingRules.isNotEmpty)
            Positioned(
              right: -210,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: passwordController.rules.map(
                      (rule) {
                        final isRuleOfended =
                            passwordController.ofendingRules.contains(rule);
                        return Row(
                          children: [
                            Icon(
                              isRuleOfended ? Icons.close : Icons.check,
                              color: isRuleOfended ? Colors.red : Colors.green,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              rule.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isRuleOfended ? Colors.red : Colors.green,
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
