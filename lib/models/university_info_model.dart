class UniversityInfoModel {
  UniversityInfoModel({
    required this.webPages,
    this.stateProvince,
    required this.alphaTwoCodes,
    required this.name,
    required this.country,
    required this.domains,
  });

  final List<String> webPages;
  String? stateProvince;
  final String alphaTwoCodes;
  final String name;
  final String country;
  final List<String> domains;

  factory UniversityInfoModel.fromJson(Map<String, dynamic> json) =>

      UniversityInfoModel(
        country: json["country"],
        domains:List.from( json["domains"]),
        alphaTwoCodes: json["alpha_two_code"],
        stateProvince: json["state-province"],
        name: json["name"],
        webPages: List.from(json["web_pages"]),
      );
}

