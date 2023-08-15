class AddBookRequestModel {
  AddBookRequestModel({
    this.name,
    this.author,
    this.publisher,
    this.image,
    this.status,
  });

  String? name;
  String? author;
  String? publisher;
  List<String>? image;
  String? status;

  factory AddBookRequestModel.fromJson(Map<String, dynamic> json) =>
      AddBookRequestModel(
        name: json["name"],
        author: json["author"],
        publisher: json["publisher"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "publisher": publisher,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "status": status,
      };
}
