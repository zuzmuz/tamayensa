import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';
import 'secret_widget.dart';
import 'router.dart';

class CapsulePage extends StatefulWidget {
  final Capsule capsule;

  const CapsulePage({super.key, required this.capsule});

  @override
  CapsulePageState createState() => CapsulePageState();
}

class CapsulePageState extends State<CapsulePage> {
  Capsule get capsule => widget.capsule;
  bool _isDirty = false;

  CapsulePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.back();
          },
        ),
        title: Text(capsule.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                capsule.secrets.add(
                  Secret(title: "wala", value: "zala", isHidden: false),
                );
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: capsule.secrets.length,
        itemBuilder: (context, index) {
          return SecretWidget(secret: capsule.secrets[index]);
        },
      ),
    );
  }
}
