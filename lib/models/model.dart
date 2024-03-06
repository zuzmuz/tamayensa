abstract class Model {
  Model clone();
}

class Vault implements Model {
  String name;
  List<Capsule> capsules;
  String password;

  Vault({required this.name, required this.password, required this.capsules});

  @override
  Vault clone() {
    return Vault(
      name: name,
      password: password,
      capsules: capsules.map((capsule) => capsule.clone()).toList(),
    );
  }
}

class Capsule implements Model {
  String name;
  List<Secret> secrets;

  Capsule({required this.name, this.secrets = const []});

  @override
  Capsule clone() {
    return Capsule(
      name: name,
      secrets: secrets.map((secret) => secret.clone()).toList(),
    );
  }
}

class Secret implements Model {
  String title;
  String value;
  bool isHidden;

  Secret({required this.title, required this.value, this.isHidden = true});

  @override
  Secret clone() {
    return Secret(
      title: title,
      value: value,
      isHidden: isHidden,
    );
  }
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
