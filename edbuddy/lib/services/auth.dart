import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Auth {
  final user = FirebaseAuth.instance;

  Future<String?> mailRegister(String mail, String pwd, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);

      user.currentUser!.updateDisplayName(name);
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.message}";
    }
  }

  Future<String?> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.message}";
    }
  }

  Future<String?> passReset({required String email}) async {
    try {
      await user.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.message}";
    }
  }

  Future<String?> mailSignIn(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pwd);
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.message}";
    }
  }
}
