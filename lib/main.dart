import 'package:flutter/material.dart';
import 'utils/app_colors.dart';


void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
        Widget build(BuildContext context) {
            return const MaterialApp(
                    home: Scaffold(
                        backgroundColor: AppColor.backgroundColor,
                        body: Center(
                            child: Text(
                                'Hala Rayyis', style: TextStyle(color: AppColor.foregroundColor, fontSize: 30.0)
                                )
                            )
                        )
                    );
        }
}

