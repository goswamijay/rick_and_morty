import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/LocationMainApi.dart';
import 'CharacterDetails.dart';

class DataMainPage extends StatefulWidget {
  const DataMainPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<DataMainPage> createState() => _DataMainPageState();
}

class _DataMainPageState extends State<DataMainPage> {
  @override
  Widget build(BuildContext context) {
    final locationApi = Get.put(Apis());

    return InkWell(
      onTap: () {
        Get.to(() => CharacterDetails(
              characterData: [locationApi.characterList[widget.index]],
            ));
      },
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.network(
                            locationApi.characterList[widget.index].image,
                          ))),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            locationApi.characterList[widget.index].name
                                .toString(),
                            style: const TextStyle(fontSize: 22),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
