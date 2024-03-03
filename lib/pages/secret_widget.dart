import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';

class SecretWidget extends StatefulWidget {
  final Secret secret;
  final Function? onFocused;
  final Function? onSecretChanged;

  const SecretWidget(
      {super.key, required this.secret, this.onFocused, this.onSecretChanged});

  @override
  SecretWidgetState createState() => SecretWidgetState();
}

enum SecretField { title, value }

class SecretWidgetState extends State<SecretWidget> {
  Secret get secret => widget.secret;
  SecretField? _focusedField;
  Secret? _editedSecret;

  Widget _buildField(BuildContext context, String fieldValue,
      bool fieldIsHidden, SecretField field) {
    return _focusedField == field
        ? TextField(
            autofocus: true,
            obscureText: fieldIsHidden,
            controller: TextEditingController(text: fieldValue),
            onChanged: (value) {
              _editedSecret ??= Secret(
                  title: secret.title,
                  value: secret.value,
                  isHidden: secret.isHidden);

              switch (field) {
                case SecretField.title:
                  _editedSecret!.title = value;
                  break;
                case SecretField.value:
                  _editedSecret!.value = value;
                  break;
              }
              widget.onSecretChanged?.call();
            },
          )
        : GestureDetector(
            child: fieldIsHidden ? const Text('••••') : Text(fieldValue),
            onDoubleTap: () {
              setState(() {
                _focusedField = field;
                widget.onFocused?.call();
              });
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: [
        Expanded(
          child: _buildField(context, secret.title, false, SecretField.title),
        ),
        Expanded(
          child: _buildField(
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
