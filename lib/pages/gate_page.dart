import 'package:flutter/material.dart';
import 'package:tamayensa/models/model.dart';
import 'package:tamayensa/pages/vault_page.dart';
import 'router.dart';
import '../utils/app_theme.dart';

class GatePage extends StatefulWidget {
  const GatePage({super.key});

  @override
  GatePageState createState() => GatePageState();
}

class GatePageState extends State<GatePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaults'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('Menu button pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print('Settings button pressed');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vaults.length,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {
              // context.toPage(() => VaultPage(vault: vaults[index]));
            },
            child: Text(vaults[index].name,
                style: const TextStyle(color: AppColor.foreground)),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class GatePage extends StatelessWidget {
//   final List<Vault> vaults = [
//     Vault(name: 'Personal', capsules: [], password: '1234'),
//     Vault(name: 'Work', capsules: [], password: '5678'),
//   ];

//   GatePage({Key? key}) : super(key: key);

//   @override
//   Page build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Vaults'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               print('Menu button pressed');
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               print('Settings button pressed');
//             },
//           ),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth > 600) {
//             // For big screens, show master-detail layout
//             return Row(
//               children: [
//                 // Master view (Vaults list)
//                 Expanded(
//                   flex: 1,
//                   child: ListView.builder(
//                     itemCount: vaults.length,
//                     itemBuilder: (context, index) {
//                       return TextButton(
//                         onPressed: () {
//                           // Navigate to detail screen on vault item click
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   CapsuleListScreen(vault: vaults[index]),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           vaults[index].name,
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Detail view (Initial empty container)
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: Colors.grey.shade200,
//                     child: Center(
//                       child: Text('Select a vault to view capsules'),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             // For small screens, show only master view
//             return ListView.builder(
//               itemCount: vaults.length,
//               itemBuilder: (context, index) {
//                 return TextButton(
//                   onPressed: () {
//                     // Navigate to detail screen on vault item click
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             CapsuleListScreen(vault: vaults[index]),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     vaults[index].name,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class CapsuleListScreen extends StatelessPage {
//   final Vault vault;

//   const CapsuleListScreen({required this.vault});

//   @override
//   Page build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(vault.name),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: vault.capsules.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(vault.capsules[index].name),
//             subtitle: Text(vault.capsules[index].description),
//             // Add onTap functionality for capsule item if needed
//           );
//         },
//       ),
//     );
//   }
// }

// class Vault {
//   final String name;
//   final List<Capsule> capsules;
//   final String password;

//   Vault({required this.name, required this.capsules, required this.password});
// }

// class Capsule {
//   final String name;
//   final String description;

//   Capsule({required this.name, required this.description});
// }

