class CountryModel {
  final String name;
  final List? borders;
  final int population;
  final String? flags;
  final String? capital;
  final String region;
  final String? subRegion;

  CountryModel(
      {required this.name,
      required this.population,
      required this.capital,
      required this.region,
      this.subRegion,
      this.borders,
      this.flags});

  static CountryModel fromJson(map) {
    return CountryModel(
        name: map['name'],
        population: map["population"],
        capital: map["capital"],
        region: map["region"],
        subRegion: map["subregion"] ,
        borders: map['borders'],
        flags: map['flags']['png']);
  }
}
