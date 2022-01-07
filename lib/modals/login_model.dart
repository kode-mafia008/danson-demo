// To parse this JSON data, do
//     final studentDetailsModel = studentDetailsModelFromJson(jsonString);
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.status,
        required this.token,
    });

    String? status;
    String? token;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
    };
}
