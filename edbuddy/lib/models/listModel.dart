import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/date_time_patterns.dart';

class ListingModel {
  final String desc;
  final String uid;
  final String name;
  late Timestamp timestamp;
  final String imgURL;
  final String phn;

  ListingModel({
    required this.phn,
    required this.name,
    required this.uid,
    required this.imgURL,
    required this.desc,
  });

  ListingModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        uid = json['uid'],
        desc = json['desc'],
        imgURL = json['img'],
        timestamp = json['timeStamp'],
        phn = json['phn'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'img': imgURL,
        'phn': phn,
        'desc': desc,
        'timeStamp': Timestamp.now(),
      };
}
