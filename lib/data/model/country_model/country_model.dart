class Country {
  final String name;
  final int population;

  Country({required this.name, required this.population});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      population: json['population'],
    );
  }
}
