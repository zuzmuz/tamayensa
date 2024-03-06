import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';
import 'package:tamayensa/utils/core.dart';
import 'secret_widget.dart';
import 'router.dart';

class CapsuleObserver {
  Observed focusedSecret = Observed();
  Observed modifiedCapsule = Observed();
}

class CapsulePage extends StatefulWidget {
  final Capsule capsule;
  final CapsuleObserver capsuleObserver = CapsuleObserver();

  CapsulePage({super.key, required this.capsule});

  @override
  State<CapsulePage> createState() => _CapsulePageState();
}

class _CapsulePageState extends State<CapsulePage> {
  Capsule get capsule => widget.capsule;

  _CapsulePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CapsuleAppBar(
          capsule: capsule,
          capsuleObserver: widget.capsuleObserver,
          onSave: () {},
          onAdd: () {
          print("here");
            setState(() {
              capsule.secrets.add(
                Secret(title: "New Secret", value: "New Value"),
              );
            });
          }),
      body: ListView.builder(
        itemCount: capsule.secrets.length,
        itemBuilder: (context, index) {
          return SecretWidget(
            secret: capsule.secrets[index],
            capsuleObserver: widget.capsuleObserver,
          );
        },
      ),
    );
  }
}

class CapsuleAppBar extends AppBar {
  CapsuleAppBar({
    super.key,
    required this.capsule,
    required this.capsuleObserver,
    required this.onSave,
    required this.onAdd,
  });

  final Capsule capsule;
  final CapsuleObserver capsuleObserver;
  final Function onSave;
  final Function onAdd;
  @override
  State<CapsuleAppBar> createState() => _CapsuleAppBarState();
}

class _CapsuleAppBarState extends State<CapsuleAppBar> {
  bool _dirty = false;

  List<Widget> _buildActions(BuildContext context) {
    return [
      _dirty
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
          widget.onAdd();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    widget.capsuleObserver.modifiedCapsule.observe(() {
      setState(() {
        _dirty = true;
      });
    });
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.back();
        },
      ),
      title: Text(widget.capsule.name),
      actions: _buildActions(context),
    );
  }
}
