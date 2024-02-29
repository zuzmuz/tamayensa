import 'package:flutter/material.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        home: Scaffold(
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.line,
                    foregroundColor: AppColor.foreground,
                    shadowColor: AppColor.foreground,
                    elevation: 5,
                    textStyle: const TextStyle(fontSize: 20),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    print('Button $index pressed');
                  },
                  child: Text(items[index],
                      style: const TextStyle(color: AppColor.foreground)),
                );
              }),
        ));
  }
}
