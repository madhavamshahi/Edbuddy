import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:edbuddy/services/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:io';

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

inputListing({required BuildContext context}) {
  XFile? img;
  return Alert(
      context: context,
      title: "List your supplies",
      content: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add an image"),
              GestureDetector(
                  onTap: () async {
                    img = await getImage();
                  },
                  child: Icon(FontAwesomeIcons.plus)),
            ],
          ),
          img != null
              ? Image(
                  image: FileImage(
                  File(
                    img!.path,
                  ),
                ))
              : Container(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(FontAwesomeIcons.textHeight),
              labelText: 'Description',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(FontAwesomeIcons.phone),
              labelText: 'Phone number',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
