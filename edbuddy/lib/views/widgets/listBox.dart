import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListBox extends StatelessWidget {
  //TODO use dynamic text
  const ListBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: 300,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  radius: 15,
                ),
                Text(
                  "Madhavam Shahi",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "August 20",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Image(
              height: 100,
              width: 150,
              image: AssetImage("assets/images/illus6.png"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hey guys I have a spare math book which I want to give for free, please feel free to send me a text message on this number, i'll be very happy to help you out.",
              maxLines: 6,
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
      ),
    );
  }
}
