import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.area,
    required this.population,
    required this.continents,
    required this.flagPng,
  });
  String nameCommon;
  String nameOfficial;
  String capital;
  String region;
  String subregion;
  double area;
  int population;
  String continents;
  String flagPng;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      nameCommon: json["name"]["common"],
      nameOfficial: json["name"]["official"],
      capital: List<String>.from(
              json["capital"]?.map((cap) => cap) ?? ['No Capital'])
          .toString()
          .replaceAll(']', '')
          .replaceAll('[', ''),
      region: json["region"],
      subregion: json["subregion"] ?? 'No Subregion',
      population: json["population"],
      continents: json["continents"][0],
      area: json["area"],
      flagPng: json["flags"]["png"]);

  Map<String, dynamic> toJson() => {
        "nameCommon": nameCommon,
        "nameOfficial": nameOfficial,
        "flagPng": flagPng,
        "area": area,
        "region": region,
        "population": population,
        "capital": capital
      };
}
