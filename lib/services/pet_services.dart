import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import "package:dio/dio.dart";
import 'package:json_annotation/json_annotation.dart';
part 'pet.g.dart';

@JsonSerializable()
class DioClient {
  final Pets_dio = Dio();
  final _baseUrl = 'https://coded-pets-api-crud.herokuapp.com/pets';

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);

  Future<List<Pets>> getPets() async {
    List<Pets> Pets = [];
    Response response = await Pets_dio.get(_baseUrl + '/Pets');
    var pets =
        (response.data as List).map((Pet) => Pet.fromJson1(Pet).toList());
    return pets;
  }
}
