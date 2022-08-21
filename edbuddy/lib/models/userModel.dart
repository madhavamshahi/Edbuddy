import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/date_time_patterns.dart';

class User {
  final String name;
  final String uid;
  final String major;
  late Timestamp timestamp;

  final String email;

  User(
      {required this.email,
      required this.name,
      required this.uid,
      required this.major});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        major = json['major'],
        uid = json['uid'],
        timestamp = json['timeStamp'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'major': major,
        'uid': uid,
        'email': email,
        'timeStamp': Timestamp.now(),
      };
}
