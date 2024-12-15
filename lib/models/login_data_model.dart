// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromMap(jsonString);

import 'dart:convert';

LoginDataModel loginDataModelFromMap(String str) =>
    LoginDataModel.fromMap(json.decode(str));

String loginDataModelToMap(LoginDataModel data) => json.encode(data.toMap());

class LoginDataModel {
  bool? success;
  String? message;
  Data? data;

  LoginDataModel({
    this.success,
    this.message,
    this.data,
  });

  factory LoginDataModel.fromMap(Map<String, dynamic> json) => LoginDataModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
      };
}

class User {
  String? email;
  String? password;
  int? roleId;
  String? userType;

  User({
    this.email,
    this.password,
    this.roleId,
    this.userType,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        roleId: json["roleId"],
        userType: json["userType"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "roleId": roleId,
        "userType": userType,
      };
}
