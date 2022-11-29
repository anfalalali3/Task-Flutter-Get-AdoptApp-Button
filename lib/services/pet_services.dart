import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import "package:dio/dio.dart";
import 'package:json_annotation/json_annotation.dart';

Future<List<Pet>> getPets() async {
  List<Pet> pets = [];
  Dio pet = Dio();
  try {
    Response response =
        await pet.get("https://coded-pets-api-crud.herokuapp.com/pets");

    pets = (response.data as List).map((pet) => Pet.fromJson(pet)).toList();
  } on DioError catch (error) {
    print("No Connection $error");
  }
  return pets;
}

  // Future<Pet> createPet({required Pet book}) async {
  //   late Pet retrivedPet;
  //   try {
  //     FormData data = FormData.fromMap({
  //       "title": Pet.title,
  //       "description": Pet.description,
  //       "image": await MultipartFile.fromFile(
  //         Pet.image,
  //       ),
  //     });
  //     Response response = await Pets_dio.post(_baseUrl + '/pets', data: data);
  //     retrivedPet = Pet.fromJson(response.data);
  //   } on DioError catch (error) {
  //     print(error);
  //   }
  //   return retrivedPet;
  // }

