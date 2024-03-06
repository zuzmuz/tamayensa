import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';
import 'secret_widget.dart';
import 'router.dart';

class CapsuleObserver {
  Function? _callbacks;

  void observe(Function callback) {
    print("adding callback");
    _callbacks = callback;
  }

  void notify() {
    print("notifying $_callbacks");
    _callbacks?.call();
  }
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
      ),
      body: ListView.builder(
        itemCount: capsule.secrets.length,
        itemBuilder: (context, index) {
          return SecretWidget(
            secret: capsule.secrets[index],
            capsuleObserver: widget.capsuleObserver,
            onSecretChanged: () {},
            onFocused: () {},
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
  });

  final Capsule capsule;
  final CapsuleObserver capsuleObserver;
  final Function onSave;
  @override
  State<CapsuleAppBar> createState() => _CapsuleAppBarState();
}

// TODO: the element passed to the widget should be an observable, that the state get and listens to, when the object changes
// a callback is handled here to set the state of this object only

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
          setState(() {
            // capsule.secrets.add(
            //   Secret(title: "wala", value: "zala", isHidden: false),
            // );
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    widget.capsuleObserver.observe(() {
      print("notified");
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
