class SectionModel {
  final int? id;
  final String name;

  SectionModel({
    this.id,
    required this.name,
  });

  SectionModel copyWith({
    int? id,
    String? name,
  }) =>
      SectionModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
