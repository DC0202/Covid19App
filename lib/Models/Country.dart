class Country {
  int updated;
  String countryName;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int tests;
  int population;
  String flag;

  Country(
      {this.active,
      this.cases,
      this.countryName,
      this.critical,
      this.deaths,
      this.population,
      this.recovered,
      this.tests,
      this.todayCases,
      this.todayDeaths,
      this.flag,
      this.updated});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      active: json['active'],
      cases: json['cases'],
      countryName: json['country'],
      critical: json['critical'],
      deaths: json['deaths'],
      flag: json['countryInfo']['flag'],
      population: json['population'],
      recovered: json['recovered'],
      tests: json['tests'],
      todayCases: json['todayCases'],
      todayDeaths: json['todayDeaths'],
      updated: json['updated'],
    );
  }
}
