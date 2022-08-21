import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BuddyBox extends StatelessWidget {
  const BuddyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(7)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/illus6.png"),
              ),
              SizedBox(height: 15),
              Text(
                "August 20",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Madhavam Shahi"),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Hey I'm struggling with maths, looking for someone to study with.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.blue,
                  ),
                  child: Text(
                    "Maths",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.message,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
