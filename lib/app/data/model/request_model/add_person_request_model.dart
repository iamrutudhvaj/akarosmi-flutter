class AddPersonRequestModel {
  AddPersonRequestModel({
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.reference,
  });

  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? reference;

  factory AddPersonRequestModel.fromJson(Map<String, dynamic> json) =>
      AddPersonRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "email": email,
        "reference": reference,
      };
}
