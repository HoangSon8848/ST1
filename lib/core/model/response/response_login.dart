class ResponseLogin {
  String? accessToken;
  String? refreshToken;

  ResponseLogin({this.accessToken, this.refreshToken});

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );
  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
