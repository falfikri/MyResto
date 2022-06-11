class LoginResponse {
  bool? status;
  String? pesan;

  LoginResponse({
    this.status,
    this.pesan,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
        status: json["status"],
        pesan: json["pesan"],
      );
}