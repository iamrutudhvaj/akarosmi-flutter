class EditProfileRequestModel {
  EditProfileRequestModel({
    this.firstName,
    this.lastName,
    this.date,
    this.gender,
    this.phoneCode,
    this.phoneNumber,
    this.email,
  });

  String? firstName;
  String? lastName;
  String? date;
  String? gender;
  String? phoneCode;
  String? phoneNumber;
  String? email;

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      EditProfileRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        date: json["date"],
        gender: json["gender"],
        phoneCode: json["phone_code"],
        phoneNumber: json["phone_number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "date": date,
        "gender": gender,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "email": email,
      };
}
