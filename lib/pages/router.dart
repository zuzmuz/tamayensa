import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Future<T?> toPage<T extends Object?>(Widget Function() page) {
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => page()));
  }

  void back<T extends Object?>({T? result}) {
    Navigator.pop(this, result);
  }
}
