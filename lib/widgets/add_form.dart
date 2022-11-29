import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPetForm extends StatefulWidget {
  @override
  AddPetFormState createState() {
    return AddPetFormState();
  }
}

class AddPetFormState extends State<AddPetForm> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  String kind = "";
  var _image;
  final image_picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pet title',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out the feild ";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              title = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pet Description',
            ),
            maxLines: null,
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out the feild ";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              description = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pets kind',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out the feild ";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              kind = value!;
            },
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  final XFile? image = await image_picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                   _image = File(image!.path);
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(color: Colors.blue[200]),
                  child: _image != null
                  ? Image.file(
                    _image,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fitHeight,
                  )
                : Container(
                    decoration: BoxDecoration(color: Colors.blue[200]),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Image"),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
              Pet newPet = await PetsServices().createPet(pet: pet);
              pets.insert(0, newPet);
              notifyListeners();
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  Provider.of<PetsProvider>(context,listen: false).createPet(
                    Pet( title:title, image: _image.path);
                    GoRoute.of(context).pop();
                  );
                }
              },
              child: const Text("Add Pet"),
            ),
          )
        ],
      ),
    );
  }
}
