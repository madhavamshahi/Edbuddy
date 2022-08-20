import 'package:flutter/material.dart';

import 'package:edbuddy/views/constant.dart';

import 'package:edbuddy/views/home/home.dart';

import 'package:edbuddy/views/signup/signup.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:edbuddy/views/widgets/widgets.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:edbuddy/services/auth.dart';
import 'package:edbuddy/services/firestore.dart';
import 'package:flutter/services.dart';

import 'package:edbuddy/views/widgets/loadingBar.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();

  TextEditingController pwd = TextEditingController();
  TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Flexible(
          child: BackgroundImage(
            image: 'assets/images/nf.png',
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Frogey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    cont: email,
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    cont: pwd,
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Auth auth = Auth();
                      // passReset(
                      //   context: context,
                      // );
                    },
                    child: Text(
                      'Forgot Password..?',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBlue,
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
