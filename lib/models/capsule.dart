import 'secret.dart';

class Capsule {
  String name;
  List<Secret> secrets;

  Capsule({required this.name, this.secrets = const []});
}
