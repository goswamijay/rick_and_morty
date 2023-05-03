import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/RickAndMorty/Model/LocationApiModel.dart';
import 'package:rick_and_morty/RickAndMorty/Model/ModelClassData.dart';

import '../Utils/Constant.dart';

class Apis extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await locationApiModel(currentPage.value);
  }

  RxDouble progress = 0.0.obs;
  MainData mainData =
      MainData(info: Info(count: 0, pages: 0, next: ''), results: []);
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  CharacterModel characterModel = CharacterModel(
      id: 0,
      name: '',
      status: '',
      species: '',
      type: '',
      gender: '',
      origin: Origin(name: '', url: ''),
      location: Location(name: '', url: ''),
      image: '',
      episode: [],
      url: '',
      created: '');
  List<CharacterModel> characterList = [];

  Future<MainData> locationApiModel(int page) async {
    isLoading.value = false;
    try {
      var response = await http.get(Uri.parse('$baseUrl$page'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        mainData = MainData.fromJson(jsonData);
        print(response.body);
        isLoading.value = true;
        return mainData;
      }
    } catch (e) {
      rethrow;
    }
    return mainData;
  }

  Future<void> characterData(int a) async {
    characterList.clear();
    try {
      for (int i = 0; i <= mainData.results[a].residents.length; i++) {
        progress.value = (i / mainData.results[a].residents.length).toDouble();
        var response =
            await http.get(Uri.parse(mainData.results[a].residents[i]));
        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          characterModel = CharacterModel.fromJson(jsonData);
          characterList.addAll([CharacterModel.fromJson(jsonData)]);
          log(characterList.length.toString());
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
