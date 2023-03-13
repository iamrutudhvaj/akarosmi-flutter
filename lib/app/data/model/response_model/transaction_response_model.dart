class TransactionResponseModel {
  TransactionResponseModel({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  Data? data;

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.bookId,
    this.personId,
    this.borrowedDate,
    this.returnDate,
    this.status,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? bookId;
  String? personId;
  String? borrowedDate;
  String? returnDate;
  int? status;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookId: json["bookId"],
        personId: json["personId"],
        borrowedDate: json["borrowedDate"],
        returnDate: json["returnDate"],
        status: json["status"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "bookId": bookId,
        "personId": personId,
        "borrowedDate": borrowedDate,
        "returnDate": returnDate,
        "status": status,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
