import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/date_time_patterns.dart';

class StudyBModel {
  final String desc;
  final String uid;
  final String name;
  final List sub;
  late Timestamp timestamp;
  final String phn;

  StudyBModel({
    required this.phn,
    required this.name,
    required this.uid,
    required this.sub,
    required this.desc,
  });

  StudyBModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        uid = json['uid'],
        sub = json['sub'],
        desc = json['desc'],
        timestamp = json['timeStamp'],
        phn = json['phn'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'phn': phn,
        'sub': sub,
        'desc': desc,
        'timeStamp': Timestamp.now(),
      };
}
