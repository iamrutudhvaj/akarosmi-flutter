class LoginResponse {
  LoginResponse({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  int? status;
  UserData? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class UserData {
  UserData({
    this.id,
    this.uid,
    this.firstName,
    this.lastName,
    this.date,
    this.gender,
    this.phoneCode,
    this.phoneNumber,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  String? id;
  String? uid;
  String? firstName;
  String? lastName;
  String? date;
  String? gender;
  String? phoneCode;
  String? phoneNumber;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;

  @override
  toString() => "LoginData ${toJson()}";

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        uid: json["uid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        date: json["date"],
        gender: json["gender"],
        phoneCode: json["phone_code"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        password: json["password"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "date": date,
        "gender": gender,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "email": email,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
      };
}
