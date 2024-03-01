import 'package:flutter/material.dart';

abstract class CustomPage extends StatelessWidget {
  const CustomPage({super.key});
}

extension ContextExtensions on BuildContext {
  Future<T?> toPage<T extends Object?>(CustomPage Function() page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page()));
  }

  void back<T extends Object?>({T? result}) {
    Navigator.pop(this, result);
  }
}
