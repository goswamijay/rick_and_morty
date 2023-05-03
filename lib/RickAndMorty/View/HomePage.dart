import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rick_and_morty/RickAndMorty/Controller/LocationMainApi.dart';
import 'package:rick_and_morty/RickAndMorty/Model/LocationApiModel.dart';
import 'Components/DataMainPage.dart';
import 'Components/NavbarInMainPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final locationApi = Get.put(Apis());
  List<bool> selectedButtons = List.filled(40, false);
  ScrollController controller = ScrollController();
  List<MainData> dataList = [];
  int a = 0;

  @override
  void initState() {
    locationApi.locationApiModel(locationApi.currentPage.value);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (locationApi.currentPage <= 6) {
            locationApi.locationApiModel(locationApi.currentPage.value++);
        }
      } else if (controller.position.pixels ==
          controller.position.minScrollExtent) {

          if (locationApi.currentPage > 1) {
            locationApi.locationApiModel(locationApi.currentPage.value--);
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset('Assets/logo.png', height: 100)),
            SizedBox(
              height: 50,
              child: FutureBuilder(
                  future: locationApi
                      .locationApiModel(locationApi.currentPage.value),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: locationApi.mainData.results.length,
                      itemBuilder: (context, index) {
                        return NavbarInMainPage(
                          index: index,
                          selected: selectedButtons[index],
                          onPressed: () {
                            setState(() {
                              for (int i = 0; i < selectedButtons.length; i++) {
                                selectedButtons[i] = false;
                                a = index;
                              }
                              selectedButtons[index] = true;
                            });
                          },
                          name: locationApi.mainData.results[index].name,
                        );
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 18,
              child: Obx(() => locationApi.isLoading.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            locationApi.mainData.results[a].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          Text('Characters: ${locationApi
                              .mainData.results[a].residents.length}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                          Text('Page: ${locationApi.currentPage}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),

                        ],
                      ),
                    )
                  : const SizedBox()),
            ),
            Flexible(
              child: Obx(
                () => locationApi.isLoading.value
                    ? FutureBuilder(
                        future: locationApi.characterData(a),
                        builder: (builder, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.none) {
                            return const Center(
                              child: Text("Please Select One Location"),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return GetX<Apis>(builder: (controller) {
                              return Center(
                                  child: CircularPercentIndicator(
                                radius: 120.0,
                                lineWidth: 8.0,
                                // animation: true,
                                percent: controller.progress.value,
                                center: Text(
                                  "${(controller.progress.value * 100).toStringAsFixed(0)}%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                progressColor: Colors.green,
                              ));
                            });
                          }

                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: locationApi
                                  .mainData.results[a].residents.length,
                              itemBuilder: (context, index) {
                                return DataMainPage(
                                  index: index,
                                );
                              });
                        },
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
