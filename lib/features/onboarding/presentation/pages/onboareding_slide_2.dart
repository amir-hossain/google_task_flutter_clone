import 'package:flutter/material.dart';

class OnboardingSide2 extends StatelessWidget {
  const OnboardingSide2({super.key,required this.title,required this.onButtonClick});
  final String title;
  final VoidCallback onButtonClick;

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
          "Add date or time to your tasks to get notified ",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          "Task may need additional permission to send notifications\nYou can change these in device's settings",
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        FilledButton(onPressed: onButtonClick,style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 12)), child: const Text("Got it"))
      ],
    );
  }
}