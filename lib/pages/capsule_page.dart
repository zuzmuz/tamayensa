import 'package:flutter/material.dart';

class CapsulePage extends StatelessWidget {
  final String text;

  const CapsulePage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text),
    );
  }
}
