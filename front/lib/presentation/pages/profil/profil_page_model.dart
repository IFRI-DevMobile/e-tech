import 'package:flutter/material.dart';

class User {
  final String id;
  String name;
  String email;
  String? telephone;
  String? ville;
  String? pays;
  Color? avatarColor;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.telephone,
    this.ville,
    this.pays,
    this.avatarColor,
  });

}