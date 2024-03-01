import 'package:flutter/material.dart';

class VaultPage extends StatelessWidget {
  const VaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault'),
      ),
      body: const Center(
        child: Text('Vault'),
      ),
    );
  }
}
