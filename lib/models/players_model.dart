class PlayersModel {
  PlayersModel({
    required this.data,
    required this.meta,
  });

  final List<DataP> data;
  final Meta meta;

  factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
        data: List<DataP>.from(json["data"].map((x) => DataP.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );
}

class DataP {
  DataP({
    required this.id,
    required this.firstName,
    this.heightFeet,
    this.heightInches,
    required this.lastName,
    required this.position,
    required this.team,
    this.weightPounds,
  });

  final int id;
  final String firstName;
  final int? heightFeet;
  final int? heightInches;
  final String lastName;
  final String position;
  final Team team;
  final int? weightPounds;

  factory DataP.fromJson(Map<String, dynamic> json) => DataP(
        id: json["id"],
        firstName: json["first_name"],
        heightFeet: json["height_feet"],
        heightInches: json["height_inches"],
        lastName: json["last_name"],
        position: json["position"],
        team: Team.fromJson(json["team"]),
        weightPounds: json["weight_pounds"],
      );
}

class Team {
  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String fullName;
  final String name;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: json["conference"],
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );
}

class Meta {
  Meta({
    required this.totalPages,
    required this.currentPage,
    required this.nextPage,
    required this.perPage,
    required this.totalCount,
  });

  final int totalPages;
  final int currentPage;
  final int nextPage;
  final int perPage;
  final int totalCount;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        perPage: json['per_page'],
        totalCount: json["total_count"],
      );
}
