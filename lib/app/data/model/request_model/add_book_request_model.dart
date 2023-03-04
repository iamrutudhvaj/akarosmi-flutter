class AddBookRequestModel {
  AddBookRequestModel({
    this.name,
    this.author,
    this.publisher,
    this.image,
  });

  String? name;
  String? author;
  String? publisher;
  List<String>? image;

  factory AddBookRequestModel.fromJson(Map<String, dynamic> json) =>
      AddBookRequestModel(
        name: json["name"],
        author: json["author"],
        publisher: json["publisher"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "publisher": publisher,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
      };
}
