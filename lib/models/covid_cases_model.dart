class CovidCasesModel {
  CovidCasesModel({
    required this.data,
  });

  final Data data;

  factory CovidCasesModel.fromJson(Map<String, dynamic> json) => CovidCasesModel(
        data: Data.fromJson(
          json["data"],
        ),
      );
}

class Data {
  Data({
    required this.date,
    required this.lastUpdate,
    required this.confirmed,
    required this.confirmedDiff,
    required this.deaths,
    required this.deathsDiff,
    required this.recovered,
    required this.recoveredDiff,
    required this.active,
    required this.activeDiff,
    required this.fatalityRate,
  });

  final String date;
  final String lastUpdate;
  final int confirmed;
  final int confirmedDiff;
  final int deaths;
  final int deathsDiff;
  final int recovered;
  final int recoveredDiff;
  final int active;
  final int activeDiff;
  final double fatalityRate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json['date'],
        lastUpdate: json['last_update'],
        confirmed: json['confirmed'],
        confirmedDiff: json['confirmed_diff'],
        deaths: json['deaths'],
        deathsDiff: json['deaths_diff'],
        recovered: json['recovered'],
        recoveredDiff: json['recovered_diff'],
        active: json['active'],
        activeDiff: json['active_diff'],
        fatalityRate: json['fatality_rate'],
      );
}
