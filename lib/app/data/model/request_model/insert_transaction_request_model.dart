class InsertTransactionRequestModel {
  InsertTransactionRequestModel({
    this.bookId,
    this.personId,
    this.borrowedDate,
    this.returnDate,
  });

  String? bookId;
  String? personId;
  String? borrowedDate;
  String? returnDate;

  factory InsertTransactionRequestModel.fromJson(Map<String, dynamic> json) =>
      InsertTransactionRequestModel(
        bookId: json["bookId"],
        personId: json["personId"],
        borrowedDate: json["borrowedDate"],
        returnDate: json["returnDate"],
      );

  Map<String, dynamic> toJson() => {
        "bookId": bookId,
        "personId": personId,
        "borrowedDate": borrowedDate,
        "returnDate": returnDate,
      };
}
