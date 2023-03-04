
class UploadAssetResponse {
    UploadAssetResponse({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    Map<String, String>? data;

    factory UploadAssetResponse.fromJson(Map<String, dynamic> json) => UploadAssetResponse(
        status: json["status"],
        message: json["message"],
        data: Map.from(json["data"]!).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
