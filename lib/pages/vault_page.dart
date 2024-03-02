import 'package:flutter/material.dart';
import 'package:tamayensa/pages/router.dart';
import 'capsule_page.dart';
import '../models/model.dart';

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
        title: Text(vault.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: vault.capsules.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vault.capsules[index].name),
            onTap: () {
              context.toPage(() => CapsulePage(capsule: vault.capsules[index]));
            },
          );
        },
      ),
    );
  }
}
