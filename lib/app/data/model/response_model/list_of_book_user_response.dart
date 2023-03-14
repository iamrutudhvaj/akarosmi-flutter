class BookListResponse {
  BookListResponse({
    this.message,
    this.status,
    this.page,
    this.size,
    this.data,
  });

  String? message;
  int? status;
  String? page;
  String? size;
  List<BookData>? data;

  factory BookListResponse.fromJson(Map<String, dynamic> json) =>
      BookListResponse(
        message: json["message"],
        status: json["status"],
        page: json["page"],
        size: json["size"],
        data: json["data"] == null
            ? []
            : List<BookData>.from(
                json["data"]!.map((x) => BookData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "page": page,
        "size": size,
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
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? bookId;
  String? userId;
  String? name;
  String? author;
  String? publisher;
  List<String>? images;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
        id: json["_id"],
        bookId: json["bookId"],
        userId: json["userId"],
        name: json["name"],
        author: json["author"],
        publisher: json["publisher"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
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
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
