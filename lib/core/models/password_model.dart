class PasswordModel {
  final int? id;
  final String name;
  final String email;
  final String password;
  final int? sectionId;
  final String? image;

  PasswordModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.sectionId,
    this.image,
  });

  PasswordModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    int? sectionId,
    String? image,
  }) =>
      PasswordModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        sectionId: sectionId ?? this.sectionId,
        image: image ?? this.image,
      );

  factory PasswordModel.fromJson(Map<String, dynamic> json) => PasswordModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        sectionId: json["section_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "section_id": sectionId,
        "image": image,
      };
}
