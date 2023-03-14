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
    this.bookName,
    this.personId,
    this.personName,
    this.borrowedDate,
    this.returnDate,
    this.status,
  });

  String? id;
  String? bookId;
  String? bookName;
  String? personId;
  String? personName;
  String? borrowedDate;
  String? returnDate;
  String? status;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        id: json["_id"],
        bookId: json["bookId"],
        bookName: json["bookName"],
        personId: json["personId"],
        personName: json["personName"],
        borrowedDate: json["borrowedDate"],
        returnDate: json["returnDate"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bookId": bookId,
        "bookName": bookName,
        "personId": personId,
        "personName": personName,
        "borrowedDate": borrowedDate,
        "returnDate": returnDate,
        "status": status,
      };
}
