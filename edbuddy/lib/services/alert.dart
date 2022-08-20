import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:google_fonts/google_fonts.dart';

showDetails({required BuildContext context}) {
  return Alert(
      context: context,
      title: "LOGIN",
      content: Column(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/illus6.png"),
          ),
          Text(
            "Hey guys I have a spare math book which I want to give for free, please feel free to send me a text message on this number, i'll be very happy to help you out.",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.josefinSans(
              textStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Send SMS",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
