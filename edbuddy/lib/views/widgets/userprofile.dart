import 'dart:io';

import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileView extends StatefulWidget {
  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override //TODO create this
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CircleAvatar(
                    //   radius: 70,
                    //   backgroundColor: Colors.white,
                    //   backgroundImage: AssetImage('assets/images/illus34.png'),
                    // ),
                    Container(
                      // margin: EdgeInsets.only(
                      //     top: 25.0, left: 15, right: 15, bottom: 15),
                      padding: EdgeInsets.all(75.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/illus6.png"),
                          fit: BoxFit.contain,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Madhavam Pratap Shahi",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "QuickSand",
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Computer Science",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontFamily: "QuickSand",
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10),
              OptionRow(
                onTap: () {},
                iconColor2: Color(0xFFFEF0E4),
                text: "Credits",
                iconData: FontAwesomeIcons.handshake,
                iconColor: Color(0xFFFE6D1E),
              ),
              OptionRow(
                // TODO for profile edit https://dribbble.com/shots/15054650-BoltCard-Settings-Profile
                onTap: () {},
                iconColor2: Color(0xFFECEAFE),
                text: "Study buddies",
                iconData: FontAwesomeIcons.peopleGroup,
                iconColor: Color(0xFF5722FB),
              ),
              OptionRow(
                onTap: () {},
                iconColor2: Color(0xFFE4F7FF),
                text: "View Listings",
                iconData: FontAwesomeIcons.book,
                iconColor: Color(0xFF02A2EE),
              ),
              OptionRow(
                onTap: () async {},
                iconColor2: Color(0xFFF989A4),
                text: "Sign out",
                iconData: FontAwesomeIcons.signOut,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionRow extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final IconData? iconData;
  final Color? iconColor;
  final Color? iconColor2;
  OptionRow(
      {@required this.iconColor,
      @required this.iconColor2,
      @required this.onTap,
      @required this.iconData,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: iconColor2,
              child: Icon(
                iconData,
                color: iconColor,
              ),
            ),
            Text(
              text!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
                fontSize: 20.0,
              ),
            ),
            CircleAvatar(
              backgroundColor: Color(0xFFF4F4F6),
              child: Icon(
                FontAwesomeIcons.arrowRight,
                color: Color(0xFF3B3C48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
