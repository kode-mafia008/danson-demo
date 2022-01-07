// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.status,
        required this.data,
    });

    String status;
    Data data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.email,
        required this.age,
        required this.school,
        required this.number,
    });

    String email;
    String age;
    String school;
    String number;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        age: json["age"],
        school: json["school"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "age": age,
        "school": school,
        "number": number,
    };
}
