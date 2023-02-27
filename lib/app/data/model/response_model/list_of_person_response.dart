class ListOfPersonResponseModel {
  ListOfPersonResponseModel({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  List<ListOfPersonData>? data;

  factory ListOfPersonResponseModel.fromJson(Map<String, dynamic> json) =>
      ListOfPersonResponseModel(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ListOfPersonData>.from(
                json["data"]!.map((x) => ListOfPersonData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ListOfPersonData {
  ListOfPersonData({
    this.id,
    this.personId,
    this.userId,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.reference,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? personId;
  String? userId;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? reference;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory ListOfPersonData.fromJson(Map<String, dynamic> json) =>
      ListOfPersonData(
        id: json["_id"],
        personId: json["personId"],
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        reference: json["reference"],
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
        "personId": personId,
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "email": email,
        "reference": reference,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
