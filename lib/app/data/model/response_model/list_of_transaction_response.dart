class TransactionListResponse {
  TransactionListResponse({
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
  List<TransactionData>? data;

  factory TransactionListResponse.fromJson(Map<String, dynamic> json) =>
      TransactionListResponse(
        message: json["message"],
        status: json["status"],
        page: json["page"],
        size: json["size"],
        data: json["data"] == null
            ? []
            : List<TransactionData>.from(
                json["data"]!.map((x) => TransactionData.fromJson(x))),
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

class TransactionData {
  TransactionData({
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
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
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
