import 'package:edbuddy/views/home/home.dart';
import 'package:edbuddy/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edbuddy/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Auth auth = Auth();

  if (await auth.isLoggedIn()) {
    runApp(MaterialApp(home: Home()));
  } else {
    runApp(MaterialApp(home: LoginView()));
  }
}
