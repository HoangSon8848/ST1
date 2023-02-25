// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.accessToken,
    this.refreshToken,
    this.phoneNumber,
  });

  String? accessToken;
  String? refreshToken;
  String? phoneNumber;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        refreshToken:
            json["refreshToken"] == null ? null : json["refreshToken"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
        "refreshToken": refreshToken == null ? null : refreshToken,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
      };
}
