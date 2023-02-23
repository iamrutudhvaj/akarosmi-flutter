class RegistrationResponse {
  RegistrationResponse({
    this.message,
    this.status,
  });

  String? message;
  int? status;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
