import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:edbuddy/models/listModel.dart';
import 'package:edbuddy/models/studyBModel.dart';

class Firestore {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void uploadListing(ListingModel listing) async {
    _firestore.collection("listings").doc().set(listing.toJson());
  }

  void uploadStudyBuddyReq(ListingModel listing) async {
    _firestore.collection("studyBuddyReq").doc().set(listing.toJson());
  }
}
