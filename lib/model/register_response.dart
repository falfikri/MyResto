class RegisterResponse {
  bool? status;
  String? pesan;

  RegisterResponse({
    this.status,
    this.pesan,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        pesan: json["pesan"],
      );
}