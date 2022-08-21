import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:edbuddy/models/listModel.dart';
import 'package:edbuddy/models/studyBModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadListing(ListingModel listing) async {
    await _firestore.collection("listings").doc().set(listing.toJson());
  }

  Future<void> uploadStudyBuddyReq(StudyBModel listing) async {
    _firestore.collection("studyBuddyReq").doc().set(listing.toJson());
  }

  Future<void> uploadMajor(
      String major, String? name, String? email, String? photo) async {
    _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
      {
        "major": major,
        "photo": photo,
        'email': email,
        'name': name,
      },
      SetOptions(merge: true),
    );
  }
}
