class TestApiModel {
  TestApiModel({
    required this.data,
    required this.support,
  });

  final Data data;
  final Support support;

  factory TestApiModel.fromJson(Map<String, dynamic> json) => TestApiModel(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        avatar: json["avatar"],
      );
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  final String url;
  final String text;

  factory Support.fromJson(Map<String, dynamic> json) =>
      Support(url: json["url"], text: json["text"]);
}
