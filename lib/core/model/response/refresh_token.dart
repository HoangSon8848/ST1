class RefreshToken {
  String? accessToken;

  RefreshToken({this.accessToken});

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
        accessToken: json["accessToken"],
      );
  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
      };
}
