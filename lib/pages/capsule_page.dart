import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:tamayensa/models/model.dart';
import 'router.dart';

final Logger _logger = Logger();

class CapsulePage extends StatelessWidget {
  final Capsule capsule;

  const CapsulePage({super.key, required this.capsule});

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
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: capsule.secrets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(children: [
              Expanded(
                child: Text(capsule.secrets[index].title),
              ),
              Expanded(
                child: capsule.secrets[index].isHidden
                    ? const Text('••••')
                    : Text(capsule.secrets[index].value),
              ),
            ]),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                _logger.d('Copying to clipboard');
                Clipboard.setData(
                  ClipboardData(text: capsule.secrets[index].value),
                );
                Timer(const Duration(seconds: 5), () {
                  _logger.d('Clipboard cleared');
                  Clipboard.setData(const ClipboardData(text: ''));
                });
              },
            ),
          );
        },
      ),
    );
  }
}
