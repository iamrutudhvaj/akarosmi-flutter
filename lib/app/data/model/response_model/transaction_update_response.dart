class TransactionUpdateResponse {
  TransactionUpdateResponse({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  Data? data;

  factory TransactionUpdateResponse.fromJson(Map<String, dynamic> json) =>
      TransactionUpdateResponse(
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
    this.id,
    this.bookId,
    this.personId,
    this.borrowedDate,
    this.returnDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? bookId;
  String? personId;
  String? borrowedDate;
  String? returnDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        bookId: json["bookId"],
        personId: json["personId"],
        borrowedDate: json["borrowedDate"],
        returnDate: json["returnDate"],
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
        "personId": personId,
        "borrowedDate": borrowedDate,
        "returnDate": returnDate,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
