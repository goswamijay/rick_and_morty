import 'package:flutter/foundation.dart';

class LocationApiModel {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  String created;

  LocationApiModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension,
      required this.residents,
      required this.url,
      required this.created});

  factory LocationApiModel.fromJson(dynamic json) {
    return LocationApiModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      dimension: json['dimension'] ?? '',
      residents: List.castFrom<dynamic, String>(json['residents']),
      url: json['url'] ?? '',
      created: json['created'] ?? '',
    );
  }
}

class MainData {
  MainData({
    required this.info,
    required this.results,
  });
  late final Info info;
  late final List<LocationApiModel> results;

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
        info: Info.fromJson(json['info']),
        results: List.from(json['results'])
            .map((e) => LocationApiModel.fromJson(e))
            .toList());
  }
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });
  late final int count;
  late final int pages;
  late final String next;
  late final Null prev;

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['pages'] = pages;
    _data['next'] = next;
    _data['prev'] = prev;
    return _data;
  }
}
