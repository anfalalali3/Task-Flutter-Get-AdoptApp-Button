// import 'package:adopt_app/models/pet.dart';
// import 'package:flutter/material.dart';
// import 'package:adopt_app/pages/update_page.dart';

// class UpdatePageForm extends StatefulWidget {
//   final Pet pet;
//   UpdatePageForm({required this.pet});
//   @override
//   UpdateFormState createState() {
//     return UpdateFormState();
//   }
// }

// class UpdateFormState extends State<UpdateBookForm> {
//   final _formKey = GlobalKey<FormState>();
//   var _image;
//   String title = "";
//   String description = "";
//   double price = 0;
//   final _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'Pet title',
//             ),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return "please fill out this field";
//               } else {
//                 return null;
//               }
//             },
//             onSaved: (value) {
//               title = value!;
//             },
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'Pet Description',
//             ),
//             maxLines: null,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return "please fill out this field";
//               } else {
//                 return null;
//               }
//             },
//             onSaved: (value) {
//               description = value!;
//             },
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               hintText: 'Pet kind',
//             ),
//           ),
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: () async {
//                   final XFile? image =
//                       await _picker.pickImage(source: ImageSource.gallery);
//                   setState(() {
//                     _image = File(image!.path);
//                   });
//                 },
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   margin: const EdgeInsets.only(top: 20),
//                   decoration: BoxDecoration(color: Colors.blue[200]),
//                   child: _image != null
//                       ? Image.file(
//                           _image,
//                           width: 200.0,
//                           height: 200.0,
//                           fit: BoxFit.fitHeight,
//                         )
//                       : Container(
//                           decoration: BoxDecoration(color: Colors.blue[200]),
//                           width: 200,
//                           height: 200,
//                           child: Icon(
//                             Icons.camera_alt,
//                             color: Colors.grey[800],
//                           ),
//                         ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text("Image"),
//               )
//             ],
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                 }
//               },
//               child: const Text("Update Pet"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
