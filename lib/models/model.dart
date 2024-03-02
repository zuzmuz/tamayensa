class Vault {
  String name;
  List<Capsule> capsules;
  String password;

  Vault({required this.name, required this.password, required this.capsules});
}

class Capsule {
  String name;
  List<Secret> secrets;

  Capsule({required this.name, this.secrets = const []});
}

class Secret {
  String title;
  String value;
  bool isHidden;

  Secret({required this.title, required this.value, this.isHidden = true});
}

final List<Vault> vaults = [
  Vault(
    name: 'Personal',
    password: '1234',
    capsules: [
      Capsule(
        name: 'Email',
        secrets: [
          Secret(title: 'user', value: 'zuz', isHidden: false),
          Secret(title: 'website', value: 'gmail.com'),
          Secret(title: 'password', value: 'whatevs'),
        ],
      ),
      Capsule(
        name: 'Bank',
        secrets: [
          Secret(title: 'user', value: 'zuz', isHidden: false),
          Secret(title: 'website', value: 'eblom.com'),
          Secret(title: 'password', value: 'whatevs'),
        ],
      ),
    ],
  ),
  Vault(name: 'Work', password: '5678', capsules: []),
];
