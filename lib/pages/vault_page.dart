import 'package:flutter/material.dart';
import 'package:tamayensa/pages/router.dart';
import '../models/model.dart';
import '../utils/app_theme.dart';

class VaultPage extends StatelessWidget {
  final Vault vault;

  const VaultPage({super.key, required this.vault});

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
        title: Text('Vault ${vault.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('Menu button pressed');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: vault.capsules.length,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {},
            child: Text(vault.capsules[index].name,
                style: const TextStyle(color: AppColor.foreground)),
          );
        },
      ),
    );
  }
}
