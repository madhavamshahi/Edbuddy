import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'auth.dart';

class FireStorage {
// Get a non-default Storage bucket
  final storage =
      FirebaseStorage.instanceFor(bucket: "gs://edbuddy-d08c3.appspot.com/");

  Future<String> uploadImage(File file) async {
    Auth auth = Auth();
    String uid = auth.user.currentUser!.uid;
    TaskSnapshot snapshot =
        await storage.ref().child("images/$uid").putFile(file);

    String downloadURL = await snapshot.ref.getDownloadURL();

    return downloadURL;
  }
}
