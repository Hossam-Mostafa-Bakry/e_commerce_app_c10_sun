import 'package:flutter/material.dart';

class User {
  static User? _this;

  String? userName;
  String? role;
  String? email;

  User._({
    this.userName,
    this.role,
    this.email,
  });

  factory User() {
    _this ??= User._();
    return _this!;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    if (_this == null) {
      _this = User._(
        userName: json['name'],
        email: json['email'],
       role: json['role'],
      );
    } else {
      _this!.userName = json['name'];
      _this!.email = json['email'];
     _this!.role = json['role'];
    }

    return _this!;
  }

  static printUser() {
    debugPrint(_this!.userName);
    debugPrint(_this!.email);
    debugPrint(_this!.role);
  }

  clearUser() {
    userName = null;
    role = null;
    email = null;
  }
}
