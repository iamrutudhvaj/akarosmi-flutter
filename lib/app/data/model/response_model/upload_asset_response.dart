class UploadAssetResponse {
    UploadAssetResponse({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    List<String>? data;

    factory UploadAssetResponse.fromJson(Map<String, dynamic> json) => UploadAssetResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<String>.from(data!.map((x) => x)),
    };
}
