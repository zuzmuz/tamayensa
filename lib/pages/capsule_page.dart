import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';
import 'secret_widget.dart';
import 'router.dart';

class CapsulePage extends StatefulWidget {
  final Capsule capsule;

  const CapsulePage({super.key, required this.capsule});

  @override
  State<CapsulePage> createState() => _CapsulePageState();
}

class _CapsulePageState extends State<CapsulePage> {
  Capsule get capsule => widget.capsule;

  _CapsulePageState();

  @override
  Widget build(BuildContext context) {
    print("CapsulePage build");
    return Scaffold(
      appBar: CapsuleAppBar(capsule: capsule, onSave: () {}),
      body: ListView.builder(
        itemCount: capsule.secrets.length,
        itemBuilder: (context, index) {
          return SecretWidget(
            secret: capsule.secrets[index],
            onSecretChanged: () {},
            onFocused: () {},
          );
        },
      ),
    );
  }
}

class CapsuleAppBar extends AppBar {
  CapsuleAppBar(
      {super.key, required this.capsule, required this.onSave, dirty = false})
      : _dirty = dirty;
  final bool _dirty;
  bool get dirty => _dirty;
  set dirty(bool value) {}
  final Capsule capsule;
  final Function onSave;
  @override
  State<CapsuleAppBar> createState() => _CapsuleAppBarState();

  void onSecretChanged() {
    print("onSecretChanged");
  }
}

class _CapsuleAppBarState extends State<CapsuleAppBar> {
  Capsule get capsule => widget.capsule;
  bool get dirty => widget.dirty;

  List<Widget> _buildActions(BuildContext context) {
    return [
      dirty
          ? IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                setState(() {
                  widget.onSave();
                });
              },
            )
          : const SizedBox.shrink(),
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            capsule.secrets.add(
              Secret(title: "wala", value: "zala", isHidden: false),
            );
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.back();
        },
      ),
      title: Text(capsule.name),
      actions: _buildActions(context),
    );
  }
}
