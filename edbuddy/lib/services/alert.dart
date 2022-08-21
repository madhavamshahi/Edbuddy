import 'package:edbuddy/models/studyBModel.dart';
import 'package:edbuddy/views/widgets/buddyBox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:edbuddy/services/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:edbuddy/models/listModel.dart';
import 'firestore.dart';
import 'package:edbuddy/models/listModel.dart';
import 'package:url_launcher/url_launcher.dart';

showDetails({required BuildContext context, required ListingModel listing}) {
  return Alert(
      context: context,
      title: "Listing Details",
      content: Column(
        children: <Widget>[
          Image(
            image: NetworkImage(listing.imgURL),
          ),
          SizedBox(height: 10),
          Text(
            listing.desc,
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
          onPressed: () {
            _launchURL(listing.phn);
          },
          child: Text(
            "Send SMS",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

_launchURL(String phn) async {
  String url = 'sms:$phn';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String imgURL = "";

inputListing({required BuildContext context}) {
  TextEditingController phn = TextEditingController();

  TextEditingController desc = TextEditingController();

  return Alert(
      context: context,
      title: "List your supplies",
      content: Column(
        children: <Widget>[
          SizedBox(height: 20),
          AddImage(),
          TextField(
            controller: desc,
            obscureText: false,
            decoration: InputDecoration(
              icon: Icon(FontAwesomeIcons.textHeight),
              labelText: 'Description',
            ),
          ),
          TextField(
            obscureText: false,
            controller: phn,
            decoration: InputDecoration(
              icon: Icon(FontAwesomeIcons.phone),
              labelText: 'Phone number',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () async {
            Firestore _firestore = new Firestore();
            Auth auth = Auth();
            String? name = auth.user.currentUser!.displayName;

            FirebaseStorageService storage = FirebaseStorageService();

            File file = File(img!.path);
            String downloadURL =
                await storage.uploadImageAndGetDownloadUrl(image: file);

            print("heeello");

            print(downloadURL);

            await _firestore.uploadListing(
              ListingModel(
                  profileIMG: auth.user.currentUser!.photoURL!,
                  phn: phn.text,
                  name: name!,
                  uid: auth.user.currentUser!.uid,
                  imgURL: downloadURL,
                  desc: desc.text),
            );
            Navigator.pop(context);
          },
          child: Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}

class AddImage extends StatefulWidget {
  AddImage({Key? key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

XFile? img;

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add an image"),
              ],
            ),
            GestureDetector(
              onTap: () async {
                img = await getImage();
                setState(() {});
              },
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        img != null
            ? Image(
                height: 200,
                image: FileImage(
                  File(
                    img!.path,
                  ),
                ))
            : Container(),
      ],
    );
  }
}

studyBuddyReq({required BuildContext context}) {
  TextEditingController phn = TextEditingController();

  TextEditingController des = TextEditingController();
  List<String> selected = [];
  return Alert(
      context: context,
      title: "Find your buddy",
      content: Column(
        children: <Widget>[
          SizedBox(height: 20),
          DropdownSearch<String>.multiSelection(
            items: [
              "Computer Science",
              "Data Science",
              "Economics",
              "Biology",
              "Maths",
              "Chemistry",
              "Pshycology",
              "Music",
              "Macroeconomics",
              "History",
              "Political Science",
              "Business",
              "Geology",
              "Astronomy",
              "Finance",
              "Civics",
              "Geography",
              "Physics",
            ],
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            onChanged: (List<String> g) {
              selected = g;
            },
            selectedItems: selected,
          ),
          TextField(
            obscureText: false,
            controller: phn,
            decoration: InputDecoration(
              icon: Icon(FontAwesomeIcons.phone),
              labelText: 'Phone number',
            ),
          ),
          TextField(
            controller: des,
            obscureText: false,
            decoration: InputDecoration(
              icon: Icon(FontAwesomeIcons.textHeight),
              labelText: 'Description',
            ),
          )
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () async {
            Auth auth = Auth();

            Firestore _firestore = Firestore();
            StudyBModel model = StudyBModel(
                phn: phn.text,
                name: auth.user.currentUser!.displayName!,
                uid: auth.user.currentUser!.uid,
                sub: selected,
                desc: des.text);
            await _firestore.uploadStudyBuddyReq(model);

            Navigator.pop(context);
          },
          child: Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
