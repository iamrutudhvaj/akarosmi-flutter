class InsertTransactionRequestModel {
  InsertTransactionRequestModel({
    this.bookId,
    this.personId,
    this.borrowedDate,
    this.returnDate,
    this.status,
  });

  String? bookId;
  String? personId;
  String? borrowedDate;
  String? returnDate;
  String? status;

  factory InsertTransactionRequestModel.fromJson(Map<String, dynamic> json) =>
      InsertTransactionRequestModel(
        bookId: json["bookId"],
        personId: json["personId"],
        borrowedDate: json["borrowedDate"],
        returnDate: json["returnDate"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "bookId": bookId,
        "personId": personId,
        "borrowedDate": borrowedDate,
        "returnDate": returnDate,
        "status": status,
      };
}
