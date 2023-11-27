
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  User user;
  String token;

  RegisterModel({
    required this.user,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  int id;
  String name;
  String email;
  dynamic image;
  String phoneCode;
  String phone;
  String role;
  dynamic agent;
  int code;
  int reservationCount;
  List<dynamic> permissions;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phoneCode,
    required this.phone,
    required this.role,
    required this.agent,
    required this.code,
    required this.reservationCount,
    required this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    role: json["role"],
    agent: json["agent"],
    code: json["code"],
    reservationCount: json["reservation_count"],
    permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "image": image,
    "phone_code": phoneCode,
    "phone": phone,
    "role": role,
    "agent": agent,
    "code": code,
    "reservation_count": reservationCount,
    "permissions": List<dynamic>.from(permissions.map((x) => x)),
  };
}
