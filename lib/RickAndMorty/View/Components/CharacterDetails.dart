import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/ModelClassData.dart';

class CharacterDetails extends StatefulWidget {
  final List<CharacterModel> characterData;
  const CharacterDetails({Key? key, required this.characterData})
      : super(key: key);

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    List<String> epi1 = widget.characterData[0].episode;
    List<int> numbers = [];

    for (String s in epi1) {
      List<String> parts = s.split("https://rickandmortyapi.com/api/episode/");

      int num = int.tryParse(parts.last) ?? 0;
      numbers.add(num);
    }
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.characterData[0].name,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(child: Image.network(widget.characterData[0].image)),
          SizedBox(
           height: Get.height * 0.02
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Status:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.characterData[0].status,
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.01
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Specy:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.characterData[0].species,
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.01
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Gender:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.characterData[0].gender,
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.01
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Origin:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.characterData[0].origin.name,
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.01
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Location:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.characterData[0].location.name,
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.01
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Episodes:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              numbers.toString(),
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
                SizedBox(
                    height: Get.height * 0.01
                ),
                Row(
                  children: [
                     Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Created At:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                Text(
                                  "(in API)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.characterData[0].created,
                              style: const TextStyle(fontSize: 18),
                            )))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
