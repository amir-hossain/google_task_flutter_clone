import 'package:flutter/material.dart';

class OnboardingSide1 extends StatelessWidget {
  const OnboardingSide1({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(size: 100),
        const SizedBox(height: 24),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(
          "Keep track of important things you need to get done in one place",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}