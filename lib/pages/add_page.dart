// import 'package:go_router/go_router.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:adopt_app/widgets/pet_card.dart';
// import 'package:adopt_app/providers/pets_provider.dart';
// import 'package:adopt_app/pages/home_page.dart';
// import 'package:adopt_app/widgets/add_form.dart';

// class AddPage extends StatelessWidget {
//   AddPage({Key? key}) : super(key: key);
//   final petController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add a pet"),
//       ),
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             const Text("Fill those field to add a pet"),
//             AddPetForm(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const HomePage(),
//     ),
//     GoRoute(
//       path: '/add',
//       builder: (context, state) => AddPage(),
//     ),
//   ],
// );
