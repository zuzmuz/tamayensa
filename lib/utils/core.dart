class Observed {
  Function? _callback;

  void observe(Function callback) {
    _callback = callback;
  }

  void notify() {
    _callback?.call();
  }
}
