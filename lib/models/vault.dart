import 'capsule.dart';

class Vault {
  String name;
  List<Capsule> capsules;
  String password;

  Vault({required this.name, required this.password, required this.capsules});
}

final List<Vault> vaults = [
  Vault(
      name: 'Personal',
      password: '1234',
      capsules: [Capsule(name: 'Email', secrets: [])]),
  Vault(name: 'Work', password: '5678', capsules: []),
];
