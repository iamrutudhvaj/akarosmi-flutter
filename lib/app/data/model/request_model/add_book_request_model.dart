class AddBookRequestModel {
  AddBookRequestModel({
    this.name,
    this.author,
    this.publisher,
  });

  String? name;
  String? author;
  String? publisher;

  factory AddBookRequestModel.fromJson(Map<String, dynamic> json) =>
      AddBookRequestModel(
        name: json["name"],
        author: json["author"],
        publisher: json["publisher"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "publisher": publisher,
      };
}
