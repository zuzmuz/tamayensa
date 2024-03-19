import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';
import 'google_page.dart';
import 'vault_page.dart';
import 'router.dart';

class GatePage extends StatefulWidget {
  const GatePage({super.key});

  @override
  State<GatePage> createState() => _GatePageState();
}

class _GatePageState extends State<GatePage> {
  int? _focusedIndex;
  Timer? _timer;

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaults'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.toPage(() => const GooglePage());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vaults.length,
        itemBuilder: (context, index) {
          return buildListTile(context, index);
        },
      ),
    );
  }

  ListTile buildListTile(BuildContext context, int index) {
    return ListTile(
      title: buildListTileTitle(context, index, _focusedIndex == index),
      onTap: () {
        setState(() {
          if (_focusedIndex == index) {
            _focusedIndex = null;
          } else {
            _focusedIndex = index;
          }
        });
      },
    );
  }

  Widget buildListTileTitle(BuildContext context, int index, bool focused) {
    Text title = Text(vaults[index].name);
    return focused
        ? Row(
            children: [
              Expanded(child: title),
              Expanded(
                child: TextField(
                  autofocus: true,
                  obscureText: true,
                  onChanged: (text) {
                    _timer?.cancel();
                    if (text == vaults[index].password) {
                      _timer = Timer(
                        const Duration(milliseconds: 500),
                        () {
                          context.toPage(() => VaultPage(vault: vaults[index]));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          )
        : title;
  }
}
