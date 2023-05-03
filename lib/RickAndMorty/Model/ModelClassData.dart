class CharacterModel {
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final Origin origin;
  late final Location location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final String created;
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'] ?? '',
      episode: List.castFrom<dynamic, String>(json['episode']),
      url: json['url'] ?? '',
      created: json['created'] ?? '',
    );
  }
}

class Origin {
  Origin({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Location {
  Location({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name'], url: json['url']);
  }
}
