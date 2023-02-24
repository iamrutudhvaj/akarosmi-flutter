class ForgetPasswordResponse {
  ForgetPasswordResponse({
    this.message,
    this.status,
  });

  String? message;
  int? status;

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponse(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
