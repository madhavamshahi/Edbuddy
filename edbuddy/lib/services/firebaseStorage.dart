import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'services.dart';

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;
  Future uploadImageAndGetDownloadUrl({
    required File image,
  }) async {
    Auth auth = Auth();

    String uid = auth.user.currentUser!.uid;
    var imageFileName = //TODO chng it to uid so tht it's deleted automatically whn new pic is uploaded
        uid; //uniqueID

    final storageRef = FirebaseStorage.instance.ref();
    var date = new DateTime.fromMicrosecondsSinceEpoch(50);
    final imgRef = storageRef.child("images/${uid}l$date");

    await imgRef.putFile(image);

    String ss = await imgRef.getDownloadURL();
    print('hello');
    print(ss);
    return ss;
  }
}
