import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';

class SecretWidget extends StatefulWidget {
  final Secret secret;

  const SecretWidget({super.key, required this.secret});

  @override
  SecretWidgetState createState() => SecretWidgetState();
}

enum SecretField { title, value }

class SecretWidgetState extends State<SecretWidget> {
  Secret get secret => widget.secret;
  SecretField? _focusedField;

  Widget buildField(BuildContext context, String fieldValue, bool fieldIsHidden,
      SecretField field) {
    return _focusedField == field
        ? TextField(
            autofocus: true,
            obscureText: fieldIsHidden,
            controller: TextEditingController(text: fieldValue),
            onSubmitted: (value) {
              setState(() {
                if (field == SecretField.title) {
                  secret.title = value;
                } else {
                  secret.value = value;
                }
                _focusedField = null;
              });
            },
          )
        : GestureDetector(
            child: fieldIsHidden ? const Text('••••') : Text(fieldValue),
            onDoubleTap: () {
              setState(() {
                _focusedField = field;
              });
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: [
        Expanded(
          child: buildField(context, secret.title, false, SecretField.title),
        ),
        Expanded(
          child: buildField(
              context, secret.value, secret.isHidden, SecretField.value),
        ),
      ]),
      trailing: IconButton(
        icon: const Icon(Icons.copy),
        onPressed: () {
          Clipboard.setData(
            ClipboardData(text: secret.value),
          );
          Timer(const Duration(seconds: 5), () {
            Clipboard.setData(const ClipboardData(text: ''));
          });
        },
      ),
    );
  }
}
