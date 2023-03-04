class BookListResponse {
  BookListResponse({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<BookData>? data;

  factory BookListResponse.fromJson(Map<String, dynamic> json) =>
      BookListResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<BookData>.from(
                json["data"]!.map((x) => BookData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BookData {
  BookData({
    this.id,
    this.bookId,
    this.userId,
    this.name,
    this.author,
    this.publisher,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.thumbnail,
  });

  String? id;
  String? bookId;
  String? userId;
  String? name;
  String? author;
  String? publisher;
  List<dynamic>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? thumbnail;

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
        id: json["_id"],
        bookId: json["bookId"],
        userId: json["userId"],
        name: json["name"],
        author: json["author"],
        publisher: json["publisher"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bookId": bookId,
        "userId": userId,
        "name": name,
        "author": author,
        "publisher": publisher,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "thumbnail": thumbnail,
      };
}

class ImageClass {
  ImageClass({
    this.res,
  });

  String? res;

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
        res: json["res"],
      );

  Map<String, dynamic> toJson() => {
        "res": res,
      };
}
