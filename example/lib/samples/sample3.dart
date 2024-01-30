import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';

class Sample3 extends StatelessWidget {
  const Sample3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: FancyPasswordField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Password',
          ),
          strengthIndicatorBuilder: (strength) {
            return const Column(
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password Strength',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Average',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFFF6A61E),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.5,
                  color: Colors.white,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFF6A61E),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your password is easily guessable. You can do better.',
                ),
                SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}
